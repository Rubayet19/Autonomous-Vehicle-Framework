import torch
import numpy as np
import torch.nn as nn
import cv2
# from torchvision import transforms
import albumentations
import time

import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Image
from geometry_msgs.msg import Twist
from cv_bridge import CvBridge

from road_segmentation import unet

transform = albumentations.Compose([
    albumentations.Resize(224, 224, always_apply=True),
    albumentations.Normalize(
            mean=[0.45734706, 0.43338275, 0.40058118],
            std=[0.23965294, 0.23532275, 0.2398498],
            always_apply=True)
])

# mean=[0.45734706, 0.43338275, 0.40058118]
# std=[0.23965294, 0.23532275, 0.2398498]

# pytransform = transforms.Compose([
#     transforms.Resize(224),
#     transforms.Normalize(mean=mean, std=std),
#     transforms.ToTensor(),
# ])

class RoadSegmentationNode(Node):
    def __init__(self):
        super().__init__('road_segmentation')
        self.segmentation_publisher_ = self.create_publisher(Image, '/segmentation/road', 2)
        self.image_subscriber = self.create_subscription(Image, '/video/front_camera', self.image_callback, 2)
        self.segmentation_timer = self.create_timer(.1, self.segmentation_callback)

        self.drive_commands_publisher = self.create_publisher(Twist, '/nav/cmd_vel', 2)
        self.drive_commands_timer = self.create_timer(.2, self.drive_commands_callback)

        self.bridge = CvBridge()
        self.image = np.zeros([320, 240, 3], dtype=np.uint8)

        self.Unet = unet.UNet(in_chans=3, depth=3, layers=1, skip_connection=True)
        self.Unet.load_state_dict(torch.load('/workspaces/isaac_ros-dev/src/road_segmentation/models/checkpoints/unet.pkl'))
        self.sigmoid = nn.Sigmoid()
        self.Unet.eval()
        self.center_line = 112.
        self.detected_center = 112.
        self.center_line_threshold = 16.
        self.K_p = 0.

        if torch.cuda.is_available():
            self.device = torch.device('cuda:0')
        else:
            self.device = torch.device('cpu')
        print('using device:', self.device)

        self.Unet.to(self.device)


    def image_callback(self, msg):
        self.image = self.bridge.imgmsg_to_cv2(msg)

    def segmentation_callback(self):
        with torch.no_grad():
            try:
                # Do inference
                orig_frame = self.image.copy()
                orig_frame = cv2.resize(orig_frame, (224,224), interpolation = cv2.INTER_AREA)
                frame = cv2.cvtColor(self.image, cv2.COLOR_BGR2RGB)
                frame = transform(image=frame)['image']
                frame = np.transpose(frame, (2, 0, 1))
                frame = torch.tensor(frame, dtype=torch.float32)
                frame = frame.unsqueeze(0).to(self.device)
                infer = self.Unet(frame).squeeze()
                infer = self.sigmoid(infer)

                infer = infer.detach().cpu().numpy()
                infer = np.where(infer >= .5, 0, 255).astype(np.uint8)
                # Generate intermediate image; use morphological closing to keep parts together
                inter = cv2.morphologyEx(infer, cv2.MORPH_CLOSE, cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5, 5)))

                # Find largest contour in intermediate image
                cnts, _ = cv2.findContours(inter, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)
                cnt = max(cnts, key=cv2.contourArea)

                # Create mask for detected road segment
                out = np.zeros(infer.shape, np.uint8)
                cv2.drawContours(out, [cnt], -1, 255, cv2.FILLED)
                out = cv2.bitwise_and(inter, out)
                out = cv2.cvtColor(out, cv2.COLOR_GRAY2BGR)

                # Find min and max detected road pixels in the y-axis, used for finding detected center of road
                detected_idxs = np.nonzero(out)
                y_idxs = detected_idxs[1]
                y_min = np.min(y_idxs)
                y_max = np.max(y_idxs)
                self.detected_center = (y_max + y_min) / 2
                

                # Combine images to visualization
                added_image = cv2.addWeighted(orig_frame,0.5,out,0.5,0)
                # Color "true centerline"
                added_image[:, int(self.center_line)] = [255,0,0]

                # Color detected centerline based on threshold, red if outside, green if inside threshold
                if abs(self.center_line - self.detected_center) > self.center_line_threshold:
                    added_image[:,self.detected_center.astype(int)] = [0,0,255]
                else:
                    added_image[:,self.detected_center.astype(int)] = [0,255,0]


                # publish image
                ros_image = self.bridge.cv2_to_imgmsg(added_image)
                self.segmentation_publisher_.publish(ros_image)

            except Exception as e:
                print(e)

    def drive_commands_callback(self):
        drive_twist = Twist()
        self.K_p = 0.
        if abs(self.center_line - self.detected_center) > self.center_line_threshold:
            if self.center_line - self.detected_center > 0:
                # Steer right
                # max K_p = 1.0 @ detected_center = 0 --> meaning all the way to the right
                self.K_p = abs(self.center_line - self.detected_center)/self.center_line
                print("Right turn, K_p", self.K_p)
                drive_twist.angular.z = .75*self.K_p
                drive_twist.linear.x = .25
            if self.center_line - self.detected_center < 0:
                # Steer left
                self.K_p = abs(self.center_line - self.detected_center)/self.center_line
                print("Left turn, K_p ", self.K_p)
                drive_twist.angular.z = -.5*self.K_p
                drive_twist.linear.x = .25
            self.drive_commands_publisher.publish(drive_twist)
        else:
            drive_twist.angular.z = 0.
            drive_twist.linear.x = .25
            self.drive_commands_publisher.publish(drive_twist)






def main(args=None):
    rclpy.init(args=args)
    road_segmentation_node = RoadSegmentationNode()
    rclpy.spin(road_segmentation_node)
    road_segmentation_node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
