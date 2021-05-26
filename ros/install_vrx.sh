#!/bin/bash
# File: /home/skywalker/Documents/code/configs/ros/install_vrx.sh
# Project: /home/skywalker/Documents/code/configs/ros
# Created Date: Monday, May 10th 2021, 4:35:57 pm
# Author: Skywalker Wang
# -----
# Last Modified: Mon May 10 2021
# Modified By: Skywalker Wang
# -----
# Copyright (c) 2021 Skywalker Inc.
# ------------------------------------
# CLI editing!
#-----------------



mkdir -p ~/Documents/code/ros/vrx/docker && cd ~/Documents/code/ros/vrx/docker
wget https://raw.githubusercontent.com/osrf/vrx/master/docker/run.bash
chmod u+x run.bash