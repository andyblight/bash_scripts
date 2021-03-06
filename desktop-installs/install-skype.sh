#!/bin/bash
# From: https://askubuntu.com/questions/887389/how-to-install-skype-for-linux-in-ubuntu-16-04-via-console-only
set -e

# Download key GPG key
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -

# Add Skype to the list of Apt repositories
echo "deb https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skypeforlinux.list

# Install Skype for Linux
sudo apt update
sudo apt install skypeforlinux

# Now tidy up.  
# The installation writes the file /etc/apt/sources.list.d/skype-stable.list so we can delete the file that we created. 
sudo rm /etc/apt/sources.list.d/skypeforlinux.list

# Remove the gpg key file
rm microsoft.gpg

echo "skypeforlinux hung when the first time I used it after installation.  I quit and restarted and it worked fine after that."
