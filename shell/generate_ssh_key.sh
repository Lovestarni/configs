#!/bin/bash

# generate SSH key
echo "generate SSH key"
ssh-keygen -t ed25519 -C "lovestarsni@gmail.com"

# add agent to your system
echo "add agent to your system"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# copy the key to clipboard
# ensure xclip is install in your system
sudo apt-get install xclip -y
xclip -selection clipboard < ~/.ssh/id_ed25519.pub
echo "SSH key is copyed to your clipboard, just paste it to where need it."

# add the use info
git config --global user.email "lovestarsni@gmail.com"
git config --global user.name "skywalker"