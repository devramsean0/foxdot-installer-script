#!/bin/bash
echo "Defining Vars"
# define install mode. false = "Just Troop", true = "Troop and foxdot and SuperCollider"
installMode=$1 || false
# define current Dir
currentDir=$pwd
echo 'Ensuring GH is happy!'
# Ensure gh CLI is installed
sudo apt install gh git -y
# Insure logged into gh
gh auth login

if [ $installMode == true] 
then
    # install foxdot
    echo "Installing FoxDot"
    cd $currentDir
    gh repo clone UTCSheffield/FoxDot
    cd FoxDot
    python3 -m pip install -e .
    cd ../..
    echo "Installed FoxDot"
    # install SuperCollider
    echo "Installing SuperCollider"
    sudo apt install supercollider -y
    echo "Installed SuperCollider, Please continue quark install and start script setup manually!"
fi 
    # install Troop
    echo "Installing Troop"
    cd $currentDir
    sudo apt install python3-tk -y
    gh repo clone Qirky/Troop
    echo "Installed Troop"
