# CMake generated Testfile for 
# Source directory: /avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2
# Build directory: /avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(copyright "/usr/bin/python3.8" "-u" "/opt/ros/humble/install/share/ament_cmake_test/cmake/run_test.py" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/test_results/nvblox_nav2/copyright.xunit.xml" "--package-name" "nvblox_nav2" "--output-file" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/ament_copyright/copyright.txt" "--command" "/opt/ros/humble/install/bin/ament_copyright" "--xunit-file" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/test_results/nvblox_nav2/copyright.xunit.xml")
set_tests_properties(copyright PROPERTIES  LABELS "copyright;linter" TIMEOUT "200" WORKING_DIRECTORY "/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2" _BACKTRACE_TRIPLES "/opt/ros/humble/install/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/install/share/ament_cmake_copyright/cmake/ament_copyright.cmake;51;ament_add_test;/opt/ros/humble/install/share/ament_cmake_copyright/cmake/ament_cmake_copyright_lint_hook.cmake;18;ament_copyright;/opt/ros/humble/install/share/ament_cmake_copyright/cmake/ament_cmake_copyright_lint_hook.cmake;0;;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/install/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;21;ament_execute_extensions;/opt/ros/humble/install/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;0;;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_package.cmake;66;ament_execute_extensions;/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2/CMakeLists.txt;76;ament_package;/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2/CMakeLists.txt;0;")
add_test(cppcheck "/usr/bin/python3.8" "-u" "/opt/ros/humble/install/share/ament_cmake_test/cmake/run_test.py" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/test_results/nvblox_nav2/cppcheck.xunit.xml" "--package-name" "nvblox_nav2" "--output-file" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/ament_cppcheck/cppcheck.txt" "--command" "/opt/ros/humble/install/bin/ament_cppcheck" "--xunit-file" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/test_results/nvblox_nav2/cppcheck.xunit.xml" "--include_dirs" "/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2/include")
set_tests_properties(cppcheck PROPERTIES  LABELS "cppcheck;linter" TIMEOUT "300" WORKING_DIRECTORY "/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2" _BACKTRACE_TRIPLES "/opt/ros/humble/install/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/install/share/ament_cmake_cppcheck/cmake/ament_cppcheck.cmake;66;ament_add_test;/opt/ros/humble/install/share/ament_cmake_cppcheck/cmake/ament_cmake_cppcheck_lint_hook.cmake;83;ament_cppcheck;/opt/ros/humble/install/share/ament_cmake_cppcheck/cmake/ament_cmake_cppcheck_lint_hook.cmake;0;;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/install/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;21;ament_execute_extensions;/opt/ros/humble/install/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;0;;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_package.cmake;66;ament_execute_extensions;/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2/CMakeLists.txt;76;ament_package;/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2/CMakeLists.txt;0;")
add_test(cpplint "/usr/bin/python3.8" "-u" "/opt/ros/humble/install/share/ament_cmake_test/cmake/run_test.py" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/test_results/nvblox_nav2/cpplint.xunit.xml" "--package-name" "nvblox_nav2" "--output-file" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/ament_cpplint/cpplint.txt" "--command" "/opt/ros/humble/install/bin/ament_cpplint" "--xunit-file" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/test_results/nvblox_nav2/cpplint.xunit.xml")
set_tests_properties(cpplint PROPERTIES  LABELS "cpplint;linter" TIMEOUT "120" WORKING_DIRECTORY "/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2" _BACKTRACE_TRIPLES "/opt/ros/humble/install/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/install/share/ament_cmake_cpplint/cmake/ament_cpplint.cmake;68;ament_add_test;/opt/ros/humble/install/share/ament_cmake_cpplint/cmake/ament_cmake_cpplint_lint_hook.cmake;35;ament_cpplint;/opt/ros/humble/install/share/ament_cmake_cpplint/cmake/ament_cmake_cpplint_lint_hook.cmake;0;;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/install/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;21;ament_execute_extensions;/opt/ros/humble/install/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;0;;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_package.cmake;66;ament_execute_extensions;/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2/CMakeLists.txt;76;ament_package;/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2/CMakeLists.txt;0;")
add_test(lint_cmake "/usr/bin/python3.8" "-u" "/opt/ros/humble/install/share/ament_cmake_test/cmake/run_test.py" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/test_results/nvblox_nav2/lint_cmake.xunit.xml" "--package-name" "nvblox_nav2" "--output-file" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/ament_lint_cmake/lint_cmake.txt" "--command" "/opt/ros/humble/install/bin/ament_lint_cmake" "--xunit-file" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/test_results/nvblox_nav2/lint_cmake.xunit.xml")
set_tests_properties(lint_cmake PROPERTIES  LABELS "lint_cmake;linter" TIMEOUT "60" WORKING_DIRECTORY "/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2" _BACKTRACE_TRIPLES "/opt/ros/humble/install/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/install/share/ament_cmake_lint_cmake/cmake/ament_lint_cmake.cmake;47;ament_add_test;/opt/ros/humble/install/share/ament_cmake_lint_cmake/cmake/ament_cmake_lint_cmake_lint_hook.cmake;21;ament_lint_cmake;/opt/ros/humble/install/share/ament_cmake_lint_cmake/cmake/ament_cmake_lint_cmake_lint_hook.cmake;0;;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/install/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;21;ament_execute_extensions;/opt/ros/humble/install/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;0;;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_package.cmake;66;ament_execute_extensions;/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2/CMakeLists.txt;76;ament_package;/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2/CMakeLists.txt;0;")
add_test(uncrustify "/usr/bin/python3.8" "-u" "/opt/ros/humble/install/share/ament_cmake_test/cmake/run_test.py" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/test_results/nvblox_nav2/uncrustify.xunit.xml" "--package-name" "nvblox_nav2" "--output-file" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/ament_uncrustify/uncrustify.txt" "--command" "/opt/ros/humble/install/bin/ament_uncrustify" "--xunit-file" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/test_results/nvblox_nav2/uncrustify.xunit.xml")
set_tests_properties(uncrustify PROPERTIES  LABELS "uncrustify;linter" TIMEOUT "60" WORKING_DIRECTORY "/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2" _BACKTRACE_TRIPLES "/opt/ros/humble/install/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/install/share/ament_cmake_uncrustify/cmake/ament_uncrustify.cmake;70;ament_add_test;/opt/ros/humble/install/share/ament_cmake_uncrustify/cmake/ament_cmake_uncrustify_lint_hook.cmake;34;ament_uncrustify;/opt/ros/humble/install/share/ament_cmake_uncrustify/cmake/ament_cmake_uncrustify_lint_hook.cmake;0;;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/install/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;21;ament_execute_extensions;/opt/ros/humble/install/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;0;;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_package.cmake;66;ament_execute_extensions;/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2/CMakeLists.txt;76;ament_package;/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2/CMakeLists.txt;0;")
add_test(xmllint "/usr/bin/python3.8" "-u" "/opt/ros/humble/install/share/ament_cmake_test/cmake/run_test.py" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/test_results/nvblox_nav2/xmllint.xunit.xml" "--package-name" "nvblox_nav2" "--output-file" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/ament_xmllint/xmllint.txt" "--command" "/opt/ros/humble/install/bin/ament_xmllint" "--xunit-file" "/avlcode/workspaces/isaac_ros-dev/build/nvblox_nav2/test_results/nvblox_nav2/xmllint.xunit.xml")
set_tests_properties(xmllint PROPERTIES  LABELS "xmllint;linter" TIMEOUT "60" WORKING_DIRECTORY "/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2" _BACKTRACE_TRIPLES "/opt/ros/humble/install/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/install/share/ament_cmake_xmllint/cmake/ament_xmllint.cmake;50;ament_add_test;/opt/ros/humble/install/share/ament_cmake_xmllint/cmake/ament_cmake_xmllint_lint_hook.cmake;18;ament_xmllint;/opt/ros/humble/install/share/ament_cmake_xmllint/cmake/ament_cmake_xmllint_lint_hook.cmake;0;;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/install/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;21;ament_execute_extensions;/opt/ros/humble/install/share/ament_lint_auto/cmake/ament_lint_auto_package_hook.cmake;0;;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_execute_extensions.cmake;48;include;/opt/ros/humble/install/share/ament_cmake_core/cmake/core/ament_package.cmake;66;ament_execute_extensions;/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2/CMakeLists.txt;76;ament_package;/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_nav2/CMakeLists.txt;0;")
