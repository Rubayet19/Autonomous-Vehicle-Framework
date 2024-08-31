# CMake generated Testfile for 
# Source directory: /avlcode/workspaces/isaac_ros-dev/src/async_web_server_cpp/test
# Build directory: /avlcode/workspaces/isaac_ros-dev/build/async_web_server_cpp/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(tests "/usr/bin/python3.8" "-u" "/opt/ros/humble/install/share/ament_cmake_test/cmake/run_test.py" "/avlcode/workspaces/isaac_ros-dev/build/async_web_server_cpp/test_results/async_web_server_cpp/tests.xml" "--package-name" "async_web_server_cpp" "--generate-result-on-success" "--command" "/avlcode/workspaces/isaac_ros-dev/build/async_web_server_cpp/test/tests_.py")
set_tests_properties(tests PROPERTIES  TIMEOUT "60" WORKING_DIRECTORY "/avlcode/workspaces/isaac_ros-dev/build/async_web_server_cpp/test" _BACKTRACE_TRIPLES "/opt/ros/humble/install/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/avlcode/workspaces/isaac_ros-dev/src/async_web_server_cpp/test/CMakeLists.txt;19;ament_add_test;/avlcode/workspaces/isaac_ros-dev/src/async_web_server_cpp/test/CMakeLists.txt;0;")
