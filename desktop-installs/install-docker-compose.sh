#!/bin/bash
# From: https://docs.docker.com/compose/install/

set -e
VERSION=1.22.0

# Download the latest version of Docker Compose:
sudo curl -L "https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

#Use the latest Compose release number in the download command.
#The above command is an example, and it may become out-of-date. To ensure you have the latest version, check the Compose repository release page on GitHub.
#If you have problems installing with curl, see Alternative Install Options tab above.

#Apply executable permissions to the binary:
sudo chmod +x /usr/local/bin/docker-compose

# Optionally, install command completion for the bash and zsh shell.

#Test the installation.
docker-compose --version

# docker-compose version 1.22.0, build 1719ceb
