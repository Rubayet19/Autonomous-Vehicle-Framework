# nvblox_ros Performance Measurement

The nvblox core library comes equipped with timers and nvtx ranges which provide a means of measuring performance. However, to get an accurate picture of nvblox performance on a robot, we would like to measure its performance inside a ROS 2 system.

For this purpose, we have tools for measuring performance in this subfolder.

The setup is indicated below:

 - We wrap the `nvblox_ros` node in a layer which exposes further information, specifically about which input messages are added to the reconstruction.
 - The `nvblox_performance` node subscribes to input and output messages and records their timestamps.
 - We also monitor the CPU percentage taken by the `nvblox_ros` node.

<div align="center"><img src="../resources/nvblox_performance_setup.png"/></div>

# Running a benchmark
To launch a benchmark run
```bash
ros2 run nvblox_performance_measurement run_benchmark.py {YOUR_ROSBAG_PATH}
```
where {YOUR_ROSBAG_PATH} is a path to your dataset.

The output of running this script should be something like:
```bash
Message Numbers
depth:		released :	518	    processed :	514
color:		released :	516	    processed :	513
lidar:		released :	520	    processed :	0
slice:		                    processed :	265
mesh:					        processed :	241

Message Frequencies
depth:		released Hz:	19.7	processed Hz:	19.5
color:		released Hz:	19.6	processed Hz:	19.6
lidar:		released Hz:	19.7	processed Hz:	nan
slice:		processed Hz:	10.1
mesh:		processed Hz:	0.5

Mean CPU usage: 15.7%
Mean GPU usage: 9.9%

```

The run script has a number of configuration arguments:
```bash
ros2 run nvblox_performance_measurement run_benchmark.py -h
usage: run_benchmark.py [-h] [--realsense] [--output_dir OUTPUT_DIR] [--save_results_files]
                        [--save_pulse_plot] [--save_kpi_json]
                        [bag_filepath]

Run a benchmark of nvblox_ros.

positional arguments:
  bag_filepath          Path to the bag to run the benchmark on.

optional arguments:
  -h, --help            show this help message and exit
  --realsense           Whether to use realsense settings.
  --output_dir OUTPUT_DIR
                        Directory in which to save the results files.
  --save_results_files  Flag indicating if we should save the results to files.
  --save_pulse_plot     Flag indicating if we should save the pulse plot.
  --save_kpi_json       Flag indicating if we should save the KPI table as a json.
```
