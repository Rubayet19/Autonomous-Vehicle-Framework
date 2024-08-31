# CMake generated Testfile for 
# Source directory: /avlcode/workspaces/isaac_ros-dev/src/xacro/test
# Build directory: /avlcode/workspaces/isaac_ros-dev/build/xacro/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(pytest "/usr/bin/python3.8" "-u" "/opt/ros/humble/install/share/ament_cmake_test/cmake/run_test.py" "/avlcode/workspaces/isaac_ros-dev/build/xacro/test_results/xacro/pytest.xunit.xml" "--package-name" "xacro" "--output-file" "/avlcode/workspaces/isaac_ros-dev/build/xacro/ament_cmake_pytest/pytest.txt" "--env" "AMENT_PREFIX_PATH=/avlcode/workspaces/isaac_ros-dev/build/xacro/test/test_ament_index:/opt/ros/humble/install" "--command" "/usr/bin/python3.8" "-u" "-m" "pytest" "/avlcode/workspaces/isaac_ros-dev/src/xacro/test/." "-o" "cache_dir=/avlcode/workspaces/isaac_ros-dev/build/xacro/test/ament_cmake_pytest/pytest/.cache" "--junit-xml=/avlcode/workspaces/isaac_ros-dev/build/xacro/test_results/xacro/pytest.xunit.xml" "--junit-prefix=xacro")
set_tests_properties(pytest PROPERTIES  LABELS "pytest" TIMEOUT "60" WORKING_DIRECTORY "/avlcode/workspaces/isaac_ros-dev/src/xacro/test" _BACKTRACE_TRIPLES "/opt/ros/humble/install/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/install/share/ament_cmake_pytest/cmake/ament_add_pytest_test.cmake;169;ament_add_test;/avlcode/workspaces/isaac_ros-dev/src/xacro/test/CMakeLists.txt;10;ament_add_pytest_test;/avlcode/workspaces/isaac_ros-dev/src/xacro/test/CMakeLists.txt;0;")
add_test(xacro_cmake "/avlcode/workspaces/isaac_ros-dev/src/xacro/test/test-cmake.sh" "/avlcode/workspaces/isaac_ros-dev/src/xacro/test/test-xacro-cmake")
set_tests_properties(xacro_cmake PROPERTIES  _BACKTRACE_TRIPLES "/avlcode/workspaces/isaac_ros-dev/src/xacro/test/CMakeLists.txt;15;add_test;/avlcode/workspaces/isaac_ros-dev/src/xacro/test/CMakeLists.txt;0;")
