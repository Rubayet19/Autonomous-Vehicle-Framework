add_test([=[MeshColoringTests.UniformColorSphere]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_mesh_coloring [==[--gtest_filter=MeshColoringTests.UniformColorSphere]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[MeshColoringTests.UniformColorSphere]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[MeshColoringTests.CPUvsGPUon3DMatch]=]  /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests/test_mesh_coloring [==[--gtest_filter=MeshColoringTests.CPUvsGPUon3DMatch]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[MeshColoringTests.CPUvsGPUon3DMatch]=]  PROPERTIES WORKING_DIRECTORY /avlcode/workspaces/isaac_ros-dev/build/nvblox/tests SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
set(  test_mesh_coloring_TESTS MeshColoringTests.UniformColorSphere MeshColoringTests.CPUvsGPUon3DMatch)
