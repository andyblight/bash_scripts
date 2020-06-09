#!/bin/bash
# From: https://www.lesbonscomptes.com/upplay/downloads.html#UBUNTU
set -e

sudo add-apt-repository ppa:jean-francois-dockes/upnpp1
sudo apt-get update
sudo apt-get install upplay
