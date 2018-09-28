#!/bin/bash
# From: https://code.visualstudio.com/docs/setup/linux

set -e

# Install Curl if missing.
sudo apt update
sudo apt install -y curl

# Download and install keys
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/

# Add vscode deb repo
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Update cache with the new repo and install.
sudo apt update
sudo apt install -y code
