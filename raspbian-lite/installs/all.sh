#!/bin/bash
set -e
./install-git-tools.sh
./install-docker.sh
# This depends on install-docker.sh
./install-docker-compose.sh
