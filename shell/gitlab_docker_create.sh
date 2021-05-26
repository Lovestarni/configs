#!/bin/bash
# File: /home/skywalker/Documents/code/configs/shell/gitlab_docker_create.sh
# Project: /home/skywalker/Documents/code/configs/shell
# Created Date: Monday, May 10th 2021, 2:54:37 pm
# Author: Skywalker Wang
# -----
# Last Modified: Mon May 10 2021
# Modified By: Skywalker Wang
# -----
# Copyright (c) 2021 Skywalker Inc.
# ------------------------------------
# CLI editing!
#-----------------



sudo docker run --detach   --hostname 172.16.12.2   --publish 443:443 --publish 80:80 --publish 10022:22   --publish 5005:5005 --name gitlab   --restart always   --volume /home/ca/hdd/data/gitlab/config:/etc/gitlab   --volume /home/ca/hdd/data/gitlab/logs:/var/log/gitlab   --volume /home/ca/hdd/data/gitlab/data:/var/opt/gitlab   gitlab/gitlab-ce:latest

# /etc/docker/daemon.json write in:
#     "insecure-registries": [
#       "172.16.12.2:5005"
#     ]