#!/bin/bash
###
 # @Email: lovestarsni@gmail.com
 # @Author: Skywalker Wang
 # @Date: 2021-01-16 21:57:31
 # @LastEditor: Skywalker Wang
 # @LastEditTime: 2021-01-16 21:57:46
### 
# 此脚本可同时更换apt、pip、docker、npm源为国内源，适用于RaspiOS Buster（原Raspbian）。

echo "备份原有apt源..."
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp /etc/apt/sources.list.d/raspi.list /etc/apt/sources.list.d/raspi.list.bak

echo "更换apt源..."
echo "" > /etc/apt/sources.list
echo "" > /etc/apt/sources.list.d/raspi.list

cat >> /etc/apt/sources.list <<EOF
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free
EOF

wget https://mirrors.tuna.tsinghua.edu.cn/raspberry-pi-os/raspbian.public.key
apt-key add raspbian.public.key

sudo apt -y update
sudo apt -y upgrade

cat >> /etc/apt/sources.list.d/raspi.list <<EOF
deb http://mirrors.tuna.tsinghua.edu.cn/raspberrypi/ buster main ui
EOF

wget https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/raspberrypi.gpg.key
apt-key add raspberrypi.gpg.key
echo "更换apt源完成"

echo "更换pip源..."
pip install pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
echo "更换pip源完成"

echo "更换docker源..."
cat >> /etc/docker/daemon.json <<EOF
{
  "registry-mirrors": ["https://registry.docker-cn.com"]
}
EOF

systemctl restart docker

echo "更换docker源完成"

echo "更换npm源..."
npm config set registry https://registry.npm.taobao.org
npm config get registry
echo "更换npm源完成"