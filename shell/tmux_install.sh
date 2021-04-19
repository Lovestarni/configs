#!/bin/bash
# File: /home/skywalker/Documents/code/configs/shell/tmuxInstall.sh
# Project: /home/skywalker/Documents/code/configs/shell
# Created Date: Monday, April 19th 2021, 3:08:32 pm
# Author: Skywalker Wang
# -----
# Last Modified: Mon Apr 19 2021
# Modified By: Skywalker Wang
# -----
# Copyright (c) 2021 Skywalker Inc.
# ------------------------------------
# CLI editing!
#-----------------


# install tmux and xclip for paste and copy
echo "install tmux and xclip for paste and copy"
sudo apt install tmux xclip -y

# download plugins
echo "download plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# copy configuration file to user catelog
echo "copy configuration file to user catelog"
cp ./shell/.tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf