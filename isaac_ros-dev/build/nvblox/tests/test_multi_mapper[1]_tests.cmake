add_test([=[MultiMapperTest.MaskOnAndOff]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_multi_mapper [==[--gtest_filter=MultiMapperTest.MaskOnAndOff]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[MultiMapperTest.MaskOnAndOff]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
set(  test_multi_mapper_TESTS MultiMapperTest.MaskOnAndOff)
