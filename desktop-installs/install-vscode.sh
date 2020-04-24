#!/bin/bash
# From: https://code.visualstudio.com/docs/setup/linux

set -e

# Add apt files
APT_FILE=/etc/apt/sources.list.d/vscode.list
if [ ! -e ${APT_FILE} ]
then
  echo "Adding apt files"
  wget https://packages.microsoft.com/keys/microsoft.asc -O - | gpg --dearmor > microsoft.gpg
  sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
  echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee -a ${APT_FILE}
fi

# Update cache with the new repo and install.
sudo apt update
sudo apt install -y code

# Copy settings file.
cp ./settings.json ${USER}/.config/Code/User
