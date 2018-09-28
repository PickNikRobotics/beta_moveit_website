#!/bin/bash -eu

# Bootstrap setting up the bitchin_unix environment for ubuntu

if [[ "$0" != "${BASH_SOURCE}" ]]; then
  {
    echo "This file is meant to be executed, not 'source'd:"
    echo
    echo "    ./${BASH_SOURCE}"
  } >&2
  return 1
fi

cat <<EOF

---------------------------------------------
Welcome to the BITCHIN UNIX Bootstrap script!
---------------------------------------------
An internal tool of PICKNIK Robotics.

TODO: automatically determine if there have been any changes to bitchin_unix repo, if it even exists

EOF

# Ensure there are no changes to current bitchin_unix repo
declare dummy
read -p "This script will overwrite any changes in bitchin_unix, are you sure? Press Ctrl-C to cancel" dummy

if [[ $EUID -ne 0 ]]; then
    echo "You are not a root user"
    sudo apt-get install -y git
else # assume we are docker
    apt-get update
    apt-get install -y git sudo
fi

cd ~

# TODO(davetcoleman): this causes the -u at the top to throw an unbound variable
#unalias git >/dev/null 2>/dev/null # redirects error msg output

echo "-----------------------------------------------------"
echo "-----------------------------------------------------"
echo "NOTE: if you have Github 2-factor authentication enabled you must create a personal access token and use your token instead of your password to git clone a https repo. To do this, visit: https://github.com/settings/tokens"
echo "-----------------------------------------------------"
echo "-----------------------------------------------------"

declare resp
read -p "Would you like to install Chrome now before logging into Github and getting a personal access token? (y/n)" resp

if [ "$resp" = "y" ]; then
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee -a /etc/apt/sources.list.d/google-chrome.list
  sudo apt update
  sudo apt install -y google-chrome-stable || echo -e "\e[00;31mAPT-GET FAILED\e[00m"
  google-chrome
fi

read -p "Are you ready to git clone bitchin_unix? (y/n)" dummy

rm -rf bitchin_unix
git clone https://github.com/PickNikRobotics/bitchin_unix.git
. bitchin_unix/install/ubuntu/ubuntu.sh
