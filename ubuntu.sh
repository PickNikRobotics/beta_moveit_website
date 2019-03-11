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

We will clone the github.com/PickNikRobotics/bitchin_unix repository. 
We will also help you setup a 2-factor authentication key through the Chrome browser, instead of using your normal Github password.

EOF

declare resp
read -p "Would you like to install Chrome now before logging into Github and getting a personal access token? (y/n)" resp

if [[ $EUID -ne 0 ]]; then
    echo "You are not a root user"
    sudo apt-get install -y git
else # assume we are docker
    apt-get update
    apt-get install -y git sudo
fi

cd ~

if [ "$resp" = "y" ]; then
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee -a /etc/apt/sources.list.d/google-chrome.list
  sudo apt update
  sudo apt install -y google-chrome-stable || echo -e "\e[00;31mAPT-GET FAILED\e[00m"
  google-chrome https://github.com/settings/tokens
fi

# TODO: automatically determine if there have been any changes to bitchin_unix repo, if it even exists
# Ensure there are no changes to current bitchin_unix repo
declare dummy
read -p "Ready to clone the repo. Reminder: this script will overwrite any changes in bitchin_unix, are you sure? Press Ctrl-C to cancel" dummy

rm -rf bitchin_unix

# TODO(davetcoleman): this causes the -u at the top to throw an unbound variable
#unalias git >/dev/null 2>/dev/null # redirects error msg output

git clone https://github.com/PickNikRobotics/bitchin_unix.git
chmod +x bitchin_unix/install/ubuntu/ubuntu.sh
~/bitchin_unix/install/ubuntu/ubuntu.sh
