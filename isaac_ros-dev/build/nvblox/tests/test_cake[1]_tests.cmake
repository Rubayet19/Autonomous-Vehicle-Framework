add_test([=[LayerCakeTest.addAndRetrieve]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_cake [==[--gtest_filter=LayerCakeTest.addAndRetrieve]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[LayerCakeTest.addAndRetrieve]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[LayerCakeTest.create]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_cake [==[--gtest_filter=LayerCakeTest.create]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[LayerCakeTest.create]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[LayerCakeTest.moveOperations]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_cake [==[--gtest_filter=LayerCakeTest.moveOperations]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[LayerCakeTest.moveOperations]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[LayerCakeTest.voxelAndBlockSize]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_cake [==[--gtest_filter=LayerCakeTest.voxelAndBlockSize]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[LayerCakeTest.voxelAndBlockSize]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[LayerCakeTest.differentMemoryTypes]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_cake [==[--gtest_filter=LayerCakeTest.differentMemoryTypes]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[LayerCakeTest.differentMemoryTypes]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
set(  test_cake_TESTS LayerCakeTest.addAndRetrieve LayerCakeTest.create LayerCakeTest.moveOperations LayerCakeTest.voxelAndBlockSize LayerCakeTest.differentMemoryTypes)
