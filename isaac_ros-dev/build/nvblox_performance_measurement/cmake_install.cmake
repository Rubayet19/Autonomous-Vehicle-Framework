# Install script for directory: /avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_performance_measurement/nvblox_performance_measurement

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/avlcode/workspaces/isaac_ros-dev/install/nvblox_performance_measurement")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement/results_collector_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement/results_collector_node")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement/results_collector_node"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement" TYPE EXECUTABLE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_performance_measurement/results_collector_node")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement/results_collector_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement/results_collector_node")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement/results_collector_node"
         OLD_RPATH "/avlcode/workspaces/isaac_ros-dev/install/nvblox_ros/lib:/avlcode/workspaces/isaac_ros-dev/install/nvblox_performance_measurement_msgs/lib:/avlcode/workspaces/isaac_ros-dev/install/cv_bridge/lib:/opt/ros/humble/install/lib:/avlcode/workspaces/isaac_ros-dev/install/nvblox_msgs/lib:/avlcode/workspaces/isaac_ros-dev/install/nvblox/lib:/usr/local/cuda/lib64:/avlcode/workspaces/isaac_ros-dev/install/nvblox_ros_common/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement/results_collector_node")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement/nvblox_performance_measurement_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement/nvblox_performance_measurement_node")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement/nvblox_performance_measurement_node"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement" TYPE EXECUTABLE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_performance_measurement/nvblox_performance_measurement_node")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement/nvblox_performance_measurement_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement/nvblox_performance_measurement_node")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement/nvblox_performance_measurement_node"
         OLD_RPATH "/avlcode/workspaces/isaac_ros-dev/install/nvblox_ros/lib:/avlcode/workspaces/isaac_ros-dev/install/nvblox_performance_measurement_msgs/lib:/avlcode/workspaces/isaac_ros-dev/install/nvblox/lib:/usr/local/cuda/lib64:/avlcode/workspaces/isaac_ros-dev/install/cv_bridge/lib:/opt/ros/humble/install/lib:/avlcode/workspaces/isaac_ros-dev/install/nvblox_msgs/lib:/avlcode/workspaces/isaac_ros-dev/install/nvblox_ros_common/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement/nvblox_performance_measurement_node")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_performance_measurement" TYPE DIRECTORY FILES "/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_performance_measurement/nvblox_performance_measurement/launch")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/nvblox_performance_measurement" TYPE PROGRAM FILES
    "/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_performance_measurement/nvblox_performance_measurement/scripts/run_benchmark.py"
    "/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_performance_measurement/nvblox_performance_measurement/scripts/analyze_timestamps.py"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/package_run_dependencies" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_performance_measurement/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/nvblox_performance_measurement")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/parent_prefix_path" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_performance_measurement/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/nvblox_performance_measurement")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_performance_measurement/environment" TYPE FILE FILES "/opt/ros/humble/install/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_performance_measurement/environment" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_performance_measurement/ament_cmake_environment_hooks/ament_prefix_path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_performance_measurement/environment" TYPE FILE FILES "/opt/ros/humble/install/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_performance_measurement/environment" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_performance_measurement/ament_cmake_environment_hooks/path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_performance_measurement" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_performance_measurement/ament_cmake_environment_hooks/local_setup.bash")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_performance_measurement" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_performance_measurement/ament_cmake_environment_hooks/local_setup.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_performance_measurement" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_performance_measurement/ament_cmake_environment_hooks/local_setup.zsh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_performance_measurement" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_performance_measurement/ament_cmake_environment_hooks/local_setup.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_performance_measurement" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_performance_measurement/ament_cmake_environment_hooks/package.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/packages" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_performance_measurement/ament_cmake_index/share/ament_index/resource_index/packages/nvblox_performance_measurement")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_performance_measurement/cmake" TYPE FILE FILES
    "/avlcode/workspaces/isaac_ros-dev/build/nvblox_performance_measurement/ament_cmake_core/nvblox_performance_measurementConfig.cmake"
    "/avlcode/workspaces/isaac_ros-dev/build/nvblox_performance_measurement/ament_cmake_core/nvblox_performance_measurementConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_performance_measurement" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_performance_measurement/nvblox_performance_measurement/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/avlcode/workspaces/isaac_ros-dev/build/nvblox_performance_measurement/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
