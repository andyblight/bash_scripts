#!/bin/bash
# Based on 
set -e

# Install wine.
# https://askubuntu.com/questions/1164191/wine-staging-fails-to-install-on-18-04
# https://forum.winehq.org/viewtopic.php?f=8&t=32192
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
sudo apt update
sudo apt install --install-recommends winehq-stable

# Install lutris.

sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update
sudo apt install lutris

echo "Now run lutris"
echo "If you get messages about video drivers follow the instructions."
echo "For the T410 laptops, I did this:"
echo "$ lspci -vnn | grep VGA -A 12"
echo "This told me that it was running an Intel graphics, so install mesa drivers."
echo "$ sudo apt install libgl1-mesa-dri:i386"
sudo "$ apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386"

exit 

# If the Wine install messes up follow these instructions.

sudo apt-get purge *wine*

#    Check that there's no snaps installed too (for some reason i had this - not sure if it would impact so i assumed best to remove)

sudo snap remove wine
sudo snap update wine-platform-*

# Remove the PPA official repos (they changed how they packaged this). We need to dig inside /etc/apt

grep -Ril "wine" /etc/apt

# If you get any matches comment them out or delete the keys, we will fully re-add later.

# Enable 32-bit & add new repo (check here for other ubuntu versions)

sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
sudo apt update
sudo apt upgrade
sudo apt --fix-broken install
sudo apt autoremove --purge
sudo apt upgrade

# Let's get the libfaudio & libasound2 which are the broken repos:

wget https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/Release.key
sudo apt-key add Release.key
sudo apt-add-repository 'deb https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/ ./'
sudo apt update
sudo apt install libfaudio0 libasound2-plugins:i386 -y

# Now we can install wine 5.0 as normal!

sudo apt install --install-recommends winehq-stable -y


