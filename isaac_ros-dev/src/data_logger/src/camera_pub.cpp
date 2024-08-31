#include <memory> 
#include <string> 
#include <functional> 
#include <chrono> 

#include <sensor_msgs/image_encodings.hpp>
#include <image_transport/image_transport.h> 
#include <opencv2/imgproc/imgproc.hpp> 
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/videoio.hpp> 
#include <cv_bridge/cv_bridge.h>

#include "rclcpp/rclcpp.hpp" 
#include "std_msgs/msg/string.hpp"

using namespace std::chrono_literals; 

class MinimalPublisher : public rclcpp::Node {
    public: 
        MinimalPublisher() : Node("minimal_publisher"), counter(0) {
            publisher_ = this->create_publisher<sensor_msgs::msg::Image>("topic", 10); 
            timer_ = this->create_wall_timer(500ms, 
                std::bind(&MinimalPublisher::timer_callback, this)); 
        }

    private: 
        int counter = 0;
	std::string data_file = "data_file_";
        sensor_msgs::msg::Image::SharedPtr msg_; 
        rclcpp::TimerBase::SharedPtr timer_; 
        rclcpp::Publisher<sensor_msgs::msg::Image>::SharedPtr publisher_;

        void timer_callback() {
            // cv::Mat frame; 
            cv::VideoCapture camera; 
            cv_bridge::CvImage img_bridge; 
            sensor_msgs::msg::Image img_msg; 

            int deviceID = 0; 
            int apiID = cv::CAP_ANY; 

            /* camera.open(deviceID, apiID); 
            
            if (!camera.isOpened()) {
                RCLCPP_ERROR(this->get_logger() ,"%s", "Camera failed to open.");
                return; 
            }

            camera.read(frame); */ 
	        cv::Mat frame(320, 240, CV_8UC3, cv::Scalar(0, 0, 0));  

	        std_msgs::msg::Header header; 
            header.stamp = this->now();  

            msg_ = cv_bridge::CvImage(header, sensor_msgs::image_encodings::RGB8, frame).toImageMsg(); 
            publisher_->publish(*msg_.get());

            counter++; 
        }
}; 

int main(int argc, char *argv[]){
    rclcpp::init(argc, argv); 
    auto node = std::make_shared<MinimalPublisher>();
    rclcpp::spin(node); 
    rclcpp::shutdown(); 

    return 0; 
}
