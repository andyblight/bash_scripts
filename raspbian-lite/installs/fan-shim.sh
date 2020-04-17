#!/bin/bash
# Install the Pimoroni fan shim software.

git clone https://github.com/pimoroni/fanshim-python
sudo ./install.sh
cd examples/
# The default brightness is 255 so it is very distracting. Colours are:
#   green for below off threshold, 
#   red for above on threshold, 
#   yellow for in between.
sudo ./install-service.sh --on-threshold 50 --off-threshold 45 --delay 2 --brightness 8

