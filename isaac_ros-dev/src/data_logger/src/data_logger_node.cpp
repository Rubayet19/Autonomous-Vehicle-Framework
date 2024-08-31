#include <memory> 
#include <string>
#include <fstream>
#include <filesystem>
#include <ctime> 

#include <opencv2/opencv.hpp>
#include <cv_bridge/cv_bridge.hpp>
#include <sys/types.h> 
#include <sys/stat.h>
#include "geometry_msgs/msg/twist.hpp"

#include "sensor_msgs/image_encodings.hpp" 
#include "image_transport/image_transport.hpp" 
#include "sensor_msgs/msg/image.hpp"
#include "rclcpp/rclcpp.hpp" 
#include "std_msgs/msg/string.hpp" 

#define FRAME_WIDTH 640
#define FRAME_HEIGHT 480

using std::placeholders::_1; 
namespace fs = std::filesystem;

class DataLogger: public rclcpp::Node {
	public: 
		DataLogger() : Node("data_logger_node"),  m_log_count(0), m_image_count(0){

			/* Subscribe to the front facing camera */
			// m_subscription_front_camera = this->create_subscription<sensor_msgs::msg::Image>(
			// "/video/front_fisheye_camera", 10, std::bind(&FrameMangSub::topic_callback, this, _1)); 

			// m_subscription_left_camera = this->create_subscription<sensor_msgs::msg::Image>(
			// "/video/left_camera", 10, std::bind(&FrameMangSub::topic_callback, this, _1)); 

			// m_subscription_front_camera = this->create_subscription<sensor_msgs::msg::Image>(
			// "/video/right_camera", 10, std::bind(&FrameMangSub::topic_callback, this, _1)); 

			m_subscription_steering_angle = this->create_subscription<geometry_msgs::msg::Twist>(
				"/twist_mux/cmd_vel", 10, std::bind(&DataLogger::topic_callback, this, _1));
			
			/* TODO: Integrate throttle data */ 
			/* Read from front camera and check if it's open */

			m_front_cam.open(m_front_cam_id, cv::CAP_V4L2);

			m_front_cam.set(cv::CAP_PROP_FRAME_WIDTH, FRAME_WIDTH); 
			m_front_cam.set(cv::CAP_PROP_FRAME_HEIGHT, FRAME_HEIGHT);

			if (!m_front_cam.isOpened()){
				RCLCPP_ERROR(this->get_logger(), "Front camera is not open"); 
				return; 
			}



			/* Read from left camera and check if it's open */
			m_left_cam.open(m_left_cam_id, cv::CAP_V4L2);
			m_left_cam.set(cv::CAP_PROP_FRAME_WIDTH, FRAME_WIDTH); 
			m_left_cam.set(cv::CAP_PROP_FRAME_HEIGHT, FRAME_HEIGHT);

			if (!m_left_cam.isOpened()){
				RCLCPP_ERROR(this->get_logger(), "Left Camera is not open"); 
				return; 
			}

			/* Read from right camera and check if it's open */
			m_right_cam.open(m_right_cam_id, cv::CAP_V4L2);

			m_right_cam.set(cv::CAP_PROP_FRAME_WIDTH, FRAME_WIDTH); 
			m_right_cam.set(cv::CAP_PROP_FRAME_HEIGHT, FRAME_HEIGHT);

			if (!m_right_cam.isOpened()){
				RCLCPP_ERROR(this->get_logger(), "Right Camera is not open"); 
				return; 
			}

			/* Create logging file if not existent */
			if (!fs::is_directory("/home/admin/logging")){
				fs::create_directory("/home/admin/logging"); 
			}

			/* Check whether directory exists or not */
			if (!fs::is_directory(m_drive)){
				fs::create_directory(m_drive);
			} else {
				/* TODO: Use std::distance or std::count_if */
				/* Count the number of log files in the directory */ 
				for (const auto &entry : fs::directory_iterator(m_drive)) {
					m_log_count++; 
				} 
			} 

			/* Determine whether Image directory has been created or not */ 
			if (!fs::is_directory(m_image_drive)){
				fs::create_directory(m_image_drive); 
			} else {
				/* TODO: Use std::distance or std::count_if */
				/* Count the number of images in the directory */ 
				for (const auto &entry : fs::directory_iterator(m_image_drive)) {
					m_image_count++; 
				}
			}


			/* Name the current logging file */
			m_logging_files = m_logging_files + std::to_string(m_log_count); 
			m_current_file.open(m_drive + "/" + m_logging_files + m_type_file); 

			if (!m_current_file.is_open()){
				RCLCPP_ERROR(this->get_logger(), "File is not open: %c", fs::current_path()); 
				return; 
			}

			/* Append the headers for file */
			m_current_file << "Time\t\tImage Name" << std::endl;

			/* Get current size of filesize */
			double mb = fs::file_size(m_drive + "/" + m_logging_files + m_type_file) / 1024 / 1024; 

			/* Check size of the tx file */
			if (mb >= 500){
				m_logging_files.pop_back();
				m_log_count++; 
				m_logging_files = m_logging_files + std::to_string(m_log_count);

				m_current_file.close(); 
				m_current_file.open(m_drive + "/" + m_logging_files + m_type_file); 
			}
			RCLCPP_DEBUG(this->get_logger(), "Finish Init"); 
		} 

		~DataLogger() {
			m_left_cam.release(); 
			m_right_cam.release();

			m_current_file.close(); 
		}


	private:
		rclcpp::Subscription<geometry_msgs::msg::Twist>::SharedPtr m_subscription_steering_angle;  

		cv::VideoCapture m_left_cam; 
		cv::VideoCapture m_right_cam; 
		cv::VideoCapture m_front_cam;

		const string m_left_cam_id = "left_cam"; 
		const string m_right_cam_id = "right_cam";
		const string m_front_cam_id = "front_cam";


		std::ofstream m_current_file; 

		/* '/logging' should contain logging folder */
		const std::string m_drive = "/home/admin/logging/logging_data"; // '/' is the location of 1tb drive  
		const std::string m_image_drive = "/home/admin/logging/image_data"; // 
		const std::string m_type_file = ".txt"; 

		std::string m_logging_files = "log_file_"; 

		int m_log_count;
		int m_image_count; 

		void topic_callback (const geometry_msgs::msg::Twist::SharedPtr msg) {
			

			if (!m_current_file.is_open()){
				RCLCPP_ERROR(this->get_logger(), "File is not open:  %c", fs::current_path()); 
				return; 
			}

			double steering_angle = msg->angular.z;
            int steering_angle_int = steering_angle * 61.0 + 512.0;

			cv::Mat left_frame_cam; 
			cv::Mat right_frame_cam;
			cv::Mat front_frame_cam; 

			m_left_cam.read(left_frame_cam); 
			m_right_cam.read(right_frame_cam);
			m_front_cam.read(front_frame_cam);

			m_image_count++;

			std::string front_cam_result; 
			std::string left_cam_result; 
			std::string right_cam_result;

			front_cam_result = m_image_drive + "/" + "image_front_" + std::to_string(m_image_count) + ".jpg"; 
			left_cam_result = m_image_drive + "/" + "image_left_" + std::to_string(m_image_count) + ".jpg"; 
			right_cam_result = m_image_drive + "/" + "image_right_" + std::to_string(m_image_count) + ".jpg";

			double mb = fs::file_size(m_drive + "/" + m_logging_files + m_type_file) / 1024 / 1024; 
		    if (mb >= 500) {
				m_logging_files.pop_back(); 
				m_log_count++; 
				m_logging_files = m_logging_files + std::to_string(m_log_count); 

				m_current_file.close(); 
				m_current_file.open(m_drive + "/" + m_logging_files + m_type_file); 	

				m_current_file << "Time\t\tImage Name" << std::endl;
			} 	

			/* Get the time currently */
			time_t tt; 
			std::chrono::system_clock::time_point now_time = std::chrono::system_clock::now(); 
			tt = std::chrono::system_clock::to_time_t ( now_time ); 
			
			/* Input seconds and reult to current logging file */ 
			m_current_file << tt << ": " << front_cam_result << " " << left_cam_result << " " << right_cam_result <<  " " << steering_angle_int << std::endl; 

			/* Write to the assign directory */
			cv::imwrite(right_cam_result, right_frame_cam);
			cv::imwrite(left_cam_result, left_frame_cam);
			cv::imwrite(front_cam_result, front_frame_cam); 

			RCLCPP_INFO(this->get_logger(), "%s", front_cam_result.c_str()); 
		} 
		 
}; 

int main(int argc, char *argv[]){
	rclcpp::init(argc, argv); 
    rclcpp::spin(std::make_shared<DataLogger>()); 
	rclcpp::shutdown(); 

	return 0; 
} 	
