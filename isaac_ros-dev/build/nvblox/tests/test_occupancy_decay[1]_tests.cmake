add_test([=[LayerDecayTest.EmptyLayerTest]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_occupancy_decay [==[--gtest_filter=LayerDecayTest.EmptyLayerTest]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[LayerDecayTest.EmptyLayerTest]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[LayerDecayTest.SingleDecayTest]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_occupancy_decay [==[--gtest_filter=LayerDecayTest.SingleDecayTest]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[LayerDecayTest.SingleDecayTest]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[LayerDecayTest.DecayAll]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_occupancy_decay [==[--gtest_filter=LayerDecayTest.DecayAll]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[LayerDecayTest.DecayAll]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
set(  test_occupancy_decay_TESTS LayerDecayTest.EmptyLayerTest LayerDecayTest.SingleDecayTest LayerDecayTest.DecayAll)
