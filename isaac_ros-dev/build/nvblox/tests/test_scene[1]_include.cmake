if(EXISTS "/avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_scene[1]_tests.cmake")
  include("/avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_scene[1]_tests.cmake")
else()
  add_test(test_scene_NOT_BUILT test_scene_NOT_BUILT)
endif()
