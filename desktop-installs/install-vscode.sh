#!/bin/bash
# From: https://code.visualstudio.com/docs/setup/linux
# Use .deb to prevent annoying nags from snap.
set -ex

sudo apt install wget gpg apt-transport-https
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt update
sudo apt install code

# Increase watched file limit.
echo "fs.inotify.max_user_watches = 524288" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Copy settings file.
mkdir -p /home/${USER}/.config/Code/User
cp -f ./settings.json /home/${USER}/.config/Code/User/settings.json
