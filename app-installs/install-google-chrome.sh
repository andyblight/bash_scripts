#!/bin/bash
# From: https://askubuntu.com/questions/991583/how-to-install-google-chrome-from-terminal

# Add key
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 

# Add repo
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Update and install
sudo apt update
sudo apt install -y google-chrome-stable
