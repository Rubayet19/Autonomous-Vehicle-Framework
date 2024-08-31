import cv2
import torch 
import numpy as np  

import rclpy
import torchvision.transforms as transforms
from rclpy.node import Node
from sensor_msgs.msg import Image
from geometry_msgs.msg import Twist
from cv_bridge import CvBridge

from end_to_end_CNN import end_to_end_CNN_model

transform = transforms.Compose([
    transforms.ToPILImage(), 
    transforms.Resize((66, 200)),
    transforms.ToTensor(), 
    transforms.Normalize(mean=[0.5, 0.5, 0.5], std=[0.5, 0.5, 0.5])
])

class end_to_end_CNN_node(Node):
    def __init__(self):
        super().__init__("End_to_End_CNN")
        #self.image = np.zeros([200, 66, 3], dtype=np.uint8)
        self.front_image = None
        self.left_image = None 
        self.right_image = None 
        self.steering_angle = None

        # Subscribe to the front camera 
        self.front_image_subscriber = self.create_subscription(Image, '/video/front_camera', self.front_image_callback, 2)
        self.left_image_subscriber = self.create_subscription(Image, '/video/left_camera', self.left_image_callback, 2)
        self.right_image_subscriber = self.create_subscription(Image, '/video/right_camera', self.right_image_callback, 2)
        self.steering_subscriber = self.create_subscription(Twist, '/twist_mux/cmd_vel', self.steering_callback, 2)


        # Create a publisher for the steering commands
        self.nn_steering_ = self.create_publisher(Twist, '/twist_mux/cmd_vel', 2)
        self.drive_commands_timer = self.create_timer(.2, self.interference_callback)

        # Init the End to End Convolutional Neural Network
        self.end_to_end_CNN = end_to_end_CNN_model.SelfDrivingCarCNN()
        self.end_to_end_CNN.load_state_dict(torch.load('/avlcode/workspaces/isaac_ros-dev/src/end_to_end_CNN/models/checkpoints/model.pth'))
        self.end_to_end_CNN.eval()

        self.bridge: CvBridge = CvBridge() 

        if torch.cuda.is_available():
            self.device = torch.device('cuda:0')
        else:
            self.device = torch.device('cpu')
        print('using device:', self.device)
        self.end_to_end_CNN.to(self.device)

    def front_image_callback(self, msg): 
        img = self.bridge.imgmsg_to_cv2(msg)
        # img = transform(img)
        self.front_image = img
        cv2.imwrite('/avlcode/workspaces/isaac_ros-dev/src/end_to_end_CNN/models/front.jpg', img)
        
    def right_image_callback(self, msg): 
        img = self.bridge.imgmsg_to_cv2(msg)
        # img = transform(img)
        self.right_image = img
        cv2.imwrite('/avlcode/workspaces/isaac_ros-dev/src/end_to_end_CNN/models/right.jpg', img)
        
    def left_image_callback(self, msg): 
        img = self.bridge.imgmsg_to_cv2(msg)
        self.left_image = img
        cv2.imwrite('/avlcode/workspaces/isaac_ros-dev/src/end_to_end_CNN/models/left.jpg', img)
        
    def steering_callback(self, msg): 
        self.steering_angle = msg.angular.z    

    def interference_callback(self):

        print("image")

        front_jpg = cv2.imread('/avlcode/workspaces/isaac_ros-dev/src/end_to_end_CNN/models/front.jpg')
        if front_jpg is None: 
            print("front image is none")
            return
        if self.left_image is None: 
            print("left image is None")
            return
        if self.right_image is None: 
            print("right image is None")
            return
        # if self.steering_angle is None: 
        #     print("Steering angle is none")
        #     return 
        front_frame = front_jpg 
        # front_frame = np.asarray(front_frame)
        # front_frame = np.asarray(front_frame)
        # front_frame = front_frame[60:135, :, :]
        # front_frame  = cv2.cvtColor(front_frame, cv2.COLOR_BGR2RGB)
        # front_frame = cv2.GaussianBlur(front_frame, (3, 3), 0)
        # front_frame = cv2.resize(front_frame, (66, 200))
        # front_frame = front_frame / 255.0

        # left_frame = cv2.cvtColor(self.left_image, cv2.COLOR_BGR2RGB)
        # right_frame = cv2.cvtColor(self.right_image, cv2.COLOR_BGR2RGB)
        # self.steering_angle

        

        steering_value = None 
        with torch.no_grad(): 
            front_frame = transform(front_frame)
            front_frame = torch.unsqueeze(front_frame, 1)
            front_frame = front_frame.permute(1, 0, 2, 3)
            print(front_frame.size())
            steering_value = self.end_to_end_CNN(front_frame).squeeze() # .squeeze()
        
        print("Steering value: " + str(steering_value.cpu().numpy().item()))

        drive_twist = Twist()
        drive_twist.angular.z = steering_value.cpu().numpy().item()
        drive_twist.linear.x = .25
        self.nn_steering_.publish(drive_twist)
        
        

def main(args=None):
    rclpy.init(args=args)
    end_to_end_CNN = end_to_end_CNN_node()
    rclpy.spin(end_to_end_CNN)
    end_to_end_CNN.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()