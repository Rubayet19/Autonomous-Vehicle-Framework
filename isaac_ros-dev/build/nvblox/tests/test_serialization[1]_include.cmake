if(EXISTS "/avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_serialization[1]_tests.cmake")
  include("/avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_serialization[1]_tests.cmake")
else()
  add_test(test_serialization_NOT_BUILT test_serialization_NOT_BUILT)
endif()
