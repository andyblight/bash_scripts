#!/bin/bash
set -e
./install-docker.sh
# This depends on install-docker.sh:wq
./install-docker-compose.sh
./install-google-chrome.sh
./install-skype.sh
./install-vscode.sh