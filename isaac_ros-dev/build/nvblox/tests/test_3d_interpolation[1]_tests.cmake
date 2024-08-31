add_test([=[InterpolatorTest.NeighboursTest]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_3d_interpolation [==[--gtest_filter=InterpolatorTest.NeighboursTest]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[InterpolatorTest.NeighboursTest]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[InterpolatorTest.OffsetTest]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_3d_interpolation [==[--gtest_filter=InterpolatorTest.OffsetTest]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[InterpolatorTest.OffsetTest]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[InterpolatorTest.InterpolationTest]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_3d_interpolation [==[--gtest_filter=InterpolatorTest.InterpolationTest]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[InterpolatorTest.InterpolationTest]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[InterpolatorTest.PrimitivesInterpolationTest]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_3d_interpolation [==[--gtest_filter=InterpolatorTest.PrimitivesInterpolationTest]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[InterpolatorTest.PrimitivesInterpolationTest]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
set(  test_3d_interpolation_TESTS InterpolatorTest.NeighboursTest InterpolatorTest.OffsetTest InterpolatorTest.InterpolationTest InterpolatorTest.PrimitivesInterpolationTest)
