#!/bin/bash
# bootstrap setting up the bitchin_unix environment for ubuntu

cat <<EOF

---------------------------------------------
Welcome to the BITCHIN UNIX Bootstrap script!
---------------------------------------------
An internal tool of PICKNIK Robotics.

TODO: automatically determine if there have been any changes to bitchin_unix repo, if it even exists

EOF

# Ensure there are no changes to current bitchin_unix repo
read -p "This script will overwrite any changes in bitchin_unix, are you sure? Press Ctrl-C to cancel" $dummy

if [[ $EUID -ne 0 ]]; then
    echo "You are not a root user"
    sudo apt-get install -y git
else # assume we are docker
    apt-get update
    apt-get install -y git sudo
fi

unalias git >/dev/null 2>/dev/null # redirects error msg output
cd ~

echo "-----------------------------------------------------"
echo "-----------------------------------------------------"
echo "NOTE: if you have Github 2-factor authentication enabled you must create a personal access token to git clone a https repo. To do this, visit: https://github.com/settings/tokens"
echo "-----------------------------------------------------"
echo "-----------------------------------------------------"
read -p "Are you ready to continue?" $dummy

rm -rf bitchin_unix
git clone https://github.com/PickNikRobotics/bitchin_unix.git
. bitchin_unix/install/ubuntu.sh
