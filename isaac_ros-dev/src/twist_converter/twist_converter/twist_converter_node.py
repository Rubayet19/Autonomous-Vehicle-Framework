import rclpy
from rclpy.node import Node
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist

class TwistConverter(Node):

    def __init__(self):
        super().__init__('twist_converter')
        self.twist_sub = self.create_subscription(Twist, '/odom_encoder', self.convert_twist_cb, 2)
        self.odom_pub = self.create_publisher(Odometry, '/odom/encoder', 1)

    def convert_twist_cb(self, msg):
        odom_msg = Odometry()
        odom_msg.header.frame_id = "base_link"
        odom_msg.twist.twist = msg
        self.odom_pub.publish(odom_msg)

def main(args=None):
    rclpy.init(args=args)
    twist_converter_node = TwistConverter()
    rclpy.spin(twist_converter_node)
    twist_converter_node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()