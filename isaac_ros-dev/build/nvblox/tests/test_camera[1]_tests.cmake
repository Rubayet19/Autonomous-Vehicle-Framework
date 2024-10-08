add_test([=[CameraTest.PointsInView]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_camera [==[--gtest_filter=CameraTest.PointsInView]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[CameraTest.PointsInView]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[CameraTest.CenterPixel]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_camera [==[--gtest_filter=CameraTest.CenterPixel]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[CameraTest.CenterPixel]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[CameraTest.BehindCamera]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_camera [==[--gtest_filter=CameraTest.BehindCamera]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[CameraTest.BehindCamera]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[CameraTest.OutsideImagePlane]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_camera [==[--gtest_filter=CameraTest.OutsideImagePlane]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[CameraTest.OutsideImagePlane]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[CameraTest.AxisAlignedBoundingBox]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_camera [==[--gtest_filter=CameraTest.AxisAlignedBoundingBox]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[CameraTest.AxisAlignedBoundingBox]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[CameraTest.FrustumTest]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_camera [==[--gtest_filter=CameraTest.FrustumTest]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[CameraTest.FrustumTest]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[CameraTest.FrustumAABBTest]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_camera [==[--gtest_filter=CameraTest.FrustumAABBTest]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[CameraTest.FrustumAABBTest]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[CameraTest.FrustumAtLeastOneValidVoxelTest]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_camera [==[--gtest_filter=CameraTest.FrustumAtLeastOneValidVoxelTest]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[CameraTest.FrustumAtLeastOneValidVoxelTest]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[CameraTest.UnProjectionTest]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_camera [==[--gtest_filter=CameraTest.UnProjectionTest]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[CameraTest.UnProjectionTest]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
set(  test_camera_TESTS CameraTest.PointsInView CameraTest.CenterPixel CameraTest.BehindCamera CameraTest.OutsideImagePlane CameraTest.AxisAlignedBoundingBox CameraTest.FrustumTest CameraTest.FrustumAABBTest CameraTest.FrustumAtLeastOneValidVoxelTest CameraTest.UnProjectionTest)
