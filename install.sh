#! /bin/bash
# Installs the scripts from the $1 directory.

set -e

if [ -d $1 ]
then
  echo "Installing scripts from $1 to home directory"
  cp $1/.gitconfig ${HOME}
  cp $1/.bash_aliases ${HOME}
  cp -R $1/bin ${HOME}
else
  echo "No directory '$1'"
fi
