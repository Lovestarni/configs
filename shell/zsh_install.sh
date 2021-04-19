#!/bin/bash
# File: /home/skywalker/Documents/code/configs/shell/zsh_install.sh
# Project: /home/skywalker/Documents/code/configs/shell
# Created Date: Monday, April 19th 2021, 4:09:04 pm
# Author: Skywalker Wang
# -----
# Last Modified: Mon Apr 19 2021
# Modified By: Skywalker Wang
# -----
# Copyright (c) 2021 Skywalker Inc.
# ------------------------------------
# CLI editing!
#-----------------

# install zsh and oh my zsh
# sudo apt install zsh -y
# git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
# chsh -s /bin/zsh

# install miniconda for python3.9
echo "install miniconda for python3.9"
# curl -L https://repo.anaconda.com/miniconda/Miniconda3-py39_4.9.2-Linux-x86_64.sh -o miniconda_linux_x64_latest.sh | bash

git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

cp ./shell/zsh_install.sh ~/.zshrc

# install zsh plugin management tool
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

source ~/.zplug/init.zsh
zplug install