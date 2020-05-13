#!/bin/bash
# From: https://code.visualstudio.com/docs/setup/linux
set -e

# Install using snap
sudo snap install --classic code

# Copy settings file.
mkdir -p /home/${USER}/.config/Code/User
cp -f ./settings.json /home/${USER}/.config/Code/User/settings.json
