add_test([=[TraitsTest.LayerTraits]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_traits [==[--gtest_filter=TraitsTest.LayerTraits]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[TraitsTest.LayerTraits]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
set(  test_traits_TESTS TraitsTest.LayerTraits)
