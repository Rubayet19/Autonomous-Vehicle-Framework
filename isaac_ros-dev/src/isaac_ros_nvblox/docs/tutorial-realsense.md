# Tutorial For Realsense-based Reconstruction

This tutorial demonstrates how to perform depth-camera based reconstruction using a [realsense](https://www.intel.com/content/www/us/en/architecture-and-technology/realsense-overview.html) camera, NVIDIA [VSLAM](https://github.com/NVIDIA-ISAAC-ROS/isaac_ros_visual_slam), and [nvblox](https://github.com/NVIDIA-ISAAC-ROS/isaac_ros_nvblox).

> **Note**: This tutorial requires a compatible RealSense camera from the list available [here](https://github.com/NVIDIA-ISAAC-ROS/.github/blob/main/profile/realsense-setup.md#camera-compatibility).

## Realsense Camera Firmware

This example is tested and compatible with realsense camera firmware version 5.13.0.50 which is available [here](https://dev.intelrealsense.com/docs/firmware-releases).

> Note: We experienced issues with the latest realsense firmware (version 5.14 at the time of publishing). It's possible at some point that this starts working, but our recommendation is to install *exactly* 5.13.0.50.

## Host System Setup

We have found ROS 2 message delivery to be unreliable under high load without some small modifications to the QoS profile (especially on weaker machines). Before running this example run
```bash
sudo sysctl -w net.core.rmem_max=8388608 net.core.rmem_default=8388608
```

However this only sets these parameters until reboot. To set them permanently run:
```bash
echo -e "net.core.rmem_max=8388608\nnet.core.rmem_default=8388608\n" | sudo tee /etc/sysctl.d/60-cyclonedds.conf
```
More details on DDS tuning can be found [here](https://docs.ros.org/en/rolling/How-To-Guides/DDS-tuning.html).

## Installing the Dependencies

1. Complete steps 1 and 2 described in the [quickstart guide](../README.md#quickstart) to set up your development environment and clone the required repositories.

2. Stop git tracking the `COLCON_IGNORE` file in the `realsense_splitter` package and remove it.

    ```bash
    cd ~/workspaces/isaac_ros-dev/src/isaac_ros_nvblox/nvblox_examples/realsense_splitter && \
      git update-index --assume-unchanged COLCON_IGNORE && \
      rm COLCON_IGNORE
    ```

> Note: The `COLCON_IGNORE` file was added to remove the dependency to `realsense-ros` for users that do not want to run the RealSense examples.

3. Complete the [realsense setup tutorial](https://github.com/NVIDIA-ISAAC-ROS/.github/blob/main/profile/realsense-setup.md) to set up `librealsense` *outside of the isaac_ros_common* docker, clone `realsense_ros`, and to configure the container for use with realsense.

4. Download the code for [Isaac ROS Visual SLAM](https://github.com/NVIDIA-ISAAC-ROS/isaac_ros_visual_slam.git) and [Isaac ROS NITROS](https://github.com/NVIDIA-ISAAC-ROS/isaac_ros_nitros).

    ```bash
    cd ~/workspaces/isaac_ros-dev/src && \
      git clone https://github.com/NVIDIA-ISAAC-ROS/isaac_ros_visual_slam.git
    ```

    ```bash
    git clone https://github.com/NVIDIA-ISAAC-ROS/isaac_ros_nitros
    ```

5. Launch the Docker container using the `run_dev.sh` script:

    ```bash
    cd ~/workspaces/isaac_ros-dev/src/isaac_ros_common && \
      ./scripts/run_dev.sh
    ```

6. Inside the container, install package-specific dependencies via `rosdep`:

    ```bash
    cd /workspaces/isaac_ros-dev/ && \
      rosdep install -i -r --from-paths src --rosdistro humble -y --skip-keys "libopencv-dev libopencv-contrib-dev libopencv-imgproc-dev python-opencv python3-opencv nvblox"
    ```

7. Build and source the workspace:

    ```bash
    cd /workspaces/isaac_ros-dev && \
      colcon build --symlink-install && \
      source install/setup.bash
    ```

## Example with Realsense Live Data

1. Complete the sections above.

2. Connect the RealSense device to your machine.

3. Run the ROS Docker container using the `run_dev.sh` script:

    ```bash
    cd ~/workspaces/isaac_ros-dev/src/isaac_ros_common && \
      ./scripts/run_dev.sh
    ```

4. Source the workspace:

    ```bash
    source /workspaces/isaac_ros-dev/install/setup.bash
    ```

5. At this point, you can check that the RealSense camera is connected by running realsense-viewer:

    ```bash
    realsense-viewer
    ```

6. If successful, run the launch file to spin up the example:

    ```bash
    ros2 launch nvblox_examples_bringup realsense_example.launch.py
    ```

Here is a few seconds of the result from running the example:

<div align="center"><img src="../resources/realsense_example.gif"/></div>

## Example with Realsense Recorded Data

If you want to run the realsense example on recorded data refer to the [realsense recording tutorial](./tutorial-realsense-record.md).

## Troubleshooting

See our troubleshooting page [here](troubleshooting-nvblox-realsense.md).
