#!/bin/bash
# From: https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository

set -e

echo "If this script fails at any time, run the remaining commands from this file using copy and paste."

# Update the apt package index:
sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS:
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the apt package index:
sudo apt-get update

# Install the latest version of Docker CE.
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Add the current user to the docker group
sudo usermod -aG docker ${USER}

echo "Please log out and log in again to use docker as yourself (not sudo)."
