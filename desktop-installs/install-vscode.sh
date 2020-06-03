#!/bin/bash
# From: https://code.visualstudio.com/docs/setup/linux
set -ex

# Install using snap
sudo snap install --classic code

# Increase watched file limit.
echo "fs.inotify.max_user_watches = 524288" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Copy settings file.
mkdir -p /home/${USER}/.config/Code/User
cp -f ./settings.json /home/${USER}/.config/Code/User/settings.json
