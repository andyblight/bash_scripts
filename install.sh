#! /bin/bash
# Installs the scripts in the $1 directory.
set -e

if [ -d $1 ]
then
  echo "Installing scripts from $1 to home directory"
  cp $1/.bash_aliases ~ 
  cp -R $1/bin ~
else
  echo "No directory '$1'"
fi
