#! /bin/bash
# Installs the scripts from the specified directory.

set -e

INSTALL_DIR=ubuntu18.04lts

if [ -d ${INSTALL_DIR} ]
then
  sudo apt install -y gitk vim meld
  echo "Installing scripts from ${INSTALL_DIR} to home directory"
  cp ${INSTALL_DIR}/.gitconfig ${HOME}
  cp ${INSTALL_DIR}/.bash_aliases ${HOME}
  cp -R ${INSTALL_DIR}/bin ${HOME}
  echo "Success!  Now set your git user name and email address, e.g."
  echo "$ git config --global user.name \"John Doe\""
  echo "$ git config --global user.email johndoe@example.com"
else
  echo "No directory '${INSTALL_DIR}'"
fi
