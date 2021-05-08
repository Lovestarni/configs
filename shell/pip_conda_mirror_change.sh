#!/bin/bash
# File: /home/skywalker/Documents/code/configs/shell/pip_conda_mirror_change.sh
# Project: /home/skywalker/Documents/code/configs/shell
# Created Date: Saturday, April 17th 2021, 3:51:03 pm
# Author: Skywalker Wang
# -----
# Last Modified: Sat Apr 17 2021
# Modified By: Skywalker Wang
# -----
# Copyright (c) 2021 Skywalker Inc.
# ------------------------------------
# CLI editing!
#-----------------




# 此脚本可同时更换apt、pip、docker、npm源为国内源，适用于RaspiOS Buster（原Raspbian）。

echo "备份原有apt源..."
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp /etc/apt/sources.list.d/raspi.list /etc/apt/sources.list.d/raspi.list.bak

echo "更换apt源..."
echo "" > /etc/apt/sources.list
echo "" > /etc/apt/sources.list.d/raspi.list

# ubuntu 18
# cat >> /etc/apt/sources.list <<EOF
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
# deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
# deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
# deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
# deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
# deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
# deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
# EOF

# ubuntu 20
sudo cat >> /etc/apt/sources.list <<EOF
deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
EOF

sudo apt -y update
sudo apt -y upgrade

echo "更换apt源完成"

echo "更换pip源..."
pip install pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
echo "更换pip源完成"

conda_config_file = "~/.condarc"

echo "更换conda源"
if [ ! -f "$conda_config_file" ]; then
  touch "$conda_config_file"
fi
cat >> "$conda_config_file" <<EOF
channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/
  - defaults
show_channel_urls: true
EOF
source ~/.condarc

echo "更换docker源..."
cat >> /etc/docker/daemon.json <<EOF
{
  "registry-mirrors": ["http://f1361db2.m.daocloud.io"]
}
EOF

sudo systemctl restart docker

echo "更换docker源完成"

echo "更换npm源..."
npm config set registry https://registry.npm.taobao.org
npm config get registry
echo "更换npm源完成"
