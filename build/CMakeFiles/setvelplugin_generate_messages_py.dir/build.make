# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/cmake-3.18.5/bin/cmake

# The command to remove a file.
RM = /opt/cmake-3.18.5/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pcx/set_velocity

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pcx/set_velocity/build

# Utility rule file for setvelplugin_generate_messages_py.

# Include the progress variables for this target.
include CMakeFiles/setvelplugin_generate_messages_py.dir/progress.make

CMakeFiles/setvelplugin_generate_messages_py: devel/lib/python2.7/dist-packages/setvelplugin/srv/_rotate.py
CMakeFiles/setvelplugin_generate_messages_py: devel/lib/python2.7/dist-packages/setvelplugin/srv/__init__.py


devel/lib/python2.7/dist-packages/setvelplugin/srv/_rotate.py: /opt/ros/melodic/lib/genpy/gensrv_py.py
devel/lib/python2.7/dist-packages/setvelplugin/srv/_rotate.py: ../srv/rotate.srv
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pcx/set_velocity/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating Python code from SRV setvelplugin/rotate"
	catkin_generated/env_cached.sh /usr/bin/python2 /opt/ros/melodic/share/genpy/cmake/../../../lib/genpy/gensrv_py.py /home/pcx/set_velocity/srv/rotate.srv -Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg -p setvelplugin -o /home/pcx/set_velocity/build/devel/lib/python2.7/dist-packages/setvelplugin/srv

devel/lib/python2.7/dist-packages/setvelplugin/srv/__init__.py: /opt/ros/melodic/lib/genpy/genmsg_py.py
devel/lib/python2.7/dist-packages/setvelplugin/srv/__init__.py: devel/lib/python2.7/dist-packages/setvelplugin/srv/_rotate.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pcx/set_velocity/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating Python srv __init__.py for setvelplugin"
	catkin_generated/env_cached.sh /usr/bin/python2 /opt/ros/melodic/share/genpy/cmake/../../../lib/genpy/genmsg_py.py -o /home/pcx/set_velocity/build/devel/lib/python2.7/dist-packages/setvelplugin/srv --initpy

setvelplugin_generate_messages_py: CMakeFiles/setvelplugin_generate_messages_py
setvelplugin_generate_messages_py: devel/lib/python2.7/dist-packages/setvelplugin/srv/_rotate.py
setvelplugin_generate_messages_py: devel/lib/python2.7/dist-packages/setvelplugin/srv/__init__.py
setvelplugin_generate_messages_py: CMakeFiles/setvelplugin_generate_messages_py.dir/build.make

.PHONY : setvelplugin_generate_messages_py

# Rule to build all files generated by this target.
CMakeFiles/setvelplugin_generate_messages_py.dir/build: setvelplugin_generate_messages_py

.PHONY : CMakeFiles/setvelplugin_generate_messages_py.dir/build

CMakeFiles/setvelplugin_generate_messages_py.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/setvelplugin_generate_messages_py.dir/cmake_clean.cmake
.PHONY : CMakeFiles/setvelplugin_generate_messages_py.dir/clean

CMakeFiles/setvelplugin_generate_messages_py.dir/depend:
	cd /home/pcx/set_velocity/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pcx/set_velocity /home/pcx/set_velocity /home/pcx/set_velocity/build /home/pcx/set_velocity/build /home/pcx/set_velocity/build/CMakeFiles/setvelplugin_generate_messages_py.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/setvelplugin_generate_messages_py.dir/depend

