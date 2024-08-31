# CMake generated Testfile for 
# Source directory: /avlcode/workspaces/isaac_ros-dev/src/ros-perception/vision_opencv/image_geometry
# Build directory: /avlcode/workspaces/isaac_ros-dev/build/image_geometry
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(image_geometry-utest "/usr/bin/python3.8" "-u" "/opt/ros/humble/install/share/ament_cmake_test/cmake/run_test.py" "/avlcode/workspaces/isaac_ros-dev/build/image_geometry/test_results/image_geometry/image_geometry-utest.gtest.xml" "--package-name" "image_geometry" "--output-file" "/avlcode/workspaces/isaac_ros-dev/build/image_geometry/ament_cmake_gtest/image_geometry-utest.txt" "--command" "/avlcode/workspaces/isaac_ros-dev/build/image_geometry/image_geometry-utest" "--gtest_output=xml:/avlcode/workspaces/isaac_ros-dev/build/image_geometry/test_results/image_geometry/image_geometry-utest.gtest.xml")
set_tests_properties(image_geometry-utest PROPERTIES  LABELS "gtest" REQUIRED_FILES "/avlcode/workspaces/isaac_ros-dev/build/image_geometry/image_geometry-utest" TIMEOUT "60" WORKING_DIRECTORY "/avlcode/workspaces/isaac_ros-dev/build/image_geometry" _BACKTRACE_TRIPLES "/opt/ros/humble/install/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/install/share/ament_cmake_gtest/cmake/ament_add_gtest_test.cmake;86;ament_add_test;/opt/ros/humble/install/share/ament_cmake_gtest/cmake/ament_add_gtest.cmake;93;ament_add_gtest_test;/avlcode/workspaces/isaac_ros-dev/src/ros-perception/vision_opencv/image_geometry/CMakeLists.txt;49;ament_add_gtest;/avlcode/workspaces/isaac_ros-dev/src/ros-perception/vision_opencv/image_geometry/CMakeLists.txt;0;")
subdirs("gtest")
