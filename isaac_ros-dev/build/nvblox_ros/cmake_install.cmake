# Install script for directory: /avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_ros

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/avlcode/workspaces/isaac_ros-dev/install/nvblox_ros")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_ros/include/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnvblox_ros_lib.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnvblox_ros_lib.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnvblox_ros_lib.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/libnvblox_ros_lib.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnvblox_ros_lib.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnvblox_ros_lib.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnvblox_ros_lib.so"
         OLD_RPATH "/avlcode/workspaces/isaac_ros-dev/install/nvblox/lib:/avlcode/workspaces/isaac_ros-dev/install/cv_bridge/lib:/opt/ros/humble/install/lib:/avlcode/workspaces/isaac_ros-dev/install/nvblox_msgs/lib:/avlcode/workspaces/isaac_ros-dev/install/nvblox_ros_common/lib:/usr/local/cuda/lib64:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnvblox_ros_lib.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_ros/nvblox_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_ros/nvblox_node")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_ros/nvblox_node"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/nvblox_ros" TYPE EXECUTABLE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/nvblox_node")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_ros/nvblox_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_ros/nvblox_node")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_ros/nvblox_node"
         OLD_RPATH "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros:/avlcode/workspaces/isaac_ros-dev/install/nvblox/lib:/usr/local/cuda/lib64:/avlcode/workspaces/isaac_ros-dev/install/cv_bridge/lib:/opt/ros/humble/install/lib:/avlcode/workspaces/isaac_ros-dev/install/nvblox_msgs/lib:/avlcode/workspaces/isaac_ros-dev/install/nvblox_ros_common/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_ros/nvblox_node")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_ros/nvblox_human_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_ros/nvblox_human_node")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_ros/nvblox_human_node"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/nvblox_ros" TYPE EXECUTABLE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/nvblox_human_node")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_ros/nvblox_human_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_ros/nvblox_human_node")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_ros/nvblox_human_node"
         OLD_RPATH "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros:/avlcode/workspaces/isaac_ros-dev/install/nvblox/lib:/usr/local/cuda/lib64:/avlcode/workspaces/isaac_ros-dev/install/cv_bridge/lib:/opt/ros/humble/install/lib:/avlcode/workspaces/isaac_ros-dev/install/nvblox_msgs/lib:/avlcode/workspaces/isaac_ros-dev/install/nvblox_ros_common/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/nvblox_ros/nvblox_human_node")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros" TYPE DIRECTORY FILES "/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_ros/test")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/environment" TYPE FILE FILES "/opt/ros/humble/install/lib/python3.8/site-packages/ament_package/template/environment_hook/library_path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/environment" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_environment_hooks/library_path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/package_run_dependencies" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/nvblox_ros")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/parent_prefix_path" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/nvblox_ros")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/environment" TYPE FILE FILES "/opt/ros/humble/install/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/environment" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_environment_hooks/ament_prefix_path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/environment" TYPE FILE FILES "/opt/ros/humble/install/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/environment" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_environment_hooks/path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_environment_hooks/local_setup.bash")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_environment_hooks/local_setup.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_environment_hooks/local_setup.zsh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_environment_hooks/local_setup.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_environment_hooks/package.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/packages" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_index/share/ament_index/resource_index/packages/nvblox_ros")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/rclcpp_components" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_index/share/ament_index/resource_index/rclcpp_components/nvblox_ros")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/cmake/nvblox_rosTargetsExport.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/cmake/nvblox_rosTargetsExport.cmake"
         "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/CMakeFiles/Export/share/nvblox_ros/cmake/nvblox_rosTargetsExport.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/cmake/nvblox_rosTargetsExport-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/cmake/nvblox_rosTargetsExport.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/cmake" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/CMakeFiles/Export/share/nvblox_ros/cmake/nvblox_rosTargetsExport.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/cmake" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/CMakeFiles/Export/share/nvblox_ros/cmake/nvblox_rosTargetsExport-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/cmake" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_export_include_directories/ament_cmake_export_include_directories-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/cmake" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_export_libraries/ament_cmake_export_libraries-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/cmake" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_export_targets/ament_cmake_export_targets-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/cmake" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_export_dependencies/ament_cmake_export_dependencies-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros/cmake" TYPE FILE FILES
    "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_core/nvblox_rosConfig.cmake"
    "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/ament_cmake_core/nvblox_rosConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nvblox_ros" TYPE FILE FILES "/avlcode/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_ros/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/avlcode/workspaces/isaac_ros-dev/build/nvblox_ros/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
