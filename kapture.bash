#!/bin/bash 

RED='\033[0;31m'
BLUE='\033[40;38;5;82m'
PURPLE='\033[0;35m'

source ./install_snap.bash

echo "------- Welcome to Kapture by Houdini -----------"
sleep 2


echo -e  "Checking if Snap is installed"
sleep 2


if [[ -x "$(command -v snap)" ]]
then
    echo -e " ${RED} You have Snap installed! \033[0m"
else
    install_snap
fi

sleep 2


echo "${PURPLE} ***** Creating User Config ***** \033[0m "

mkdir ~/.config


echo -e "${BLUE} ******** Installing doctl ********* \033[40m"

sudo snap install doctl

sleep 2


sleep 3

echo -n "Please enter the ID of the digital ocean droplet you want to Kapture: ";
read DROPLET_ID;

echo "checking to see if droplet exist "

if [[ -x "$((  doctl compute snapshot list | awk '/{$DROPLET_ID}/{print}'))" ]]

then 
    
    echo -n "At what time do you want this kapture to run?"
    read TIME;
    echo "Creating automated snapshots on your droplet. Please Wait..."

    crontab -l | { cat; echo "* {$TIME} * * * tugboat snapshot {$DROPLET_ID}"; } | crontab -


    echo "Automatic backup created!! It will run everyday at 23:00pm"

    echo Done
else
    echo -e "${RED} Droplets does not exist!! Kapture Not possible"
fi 

echo -e " ${BLUE} Send me bitcoin @jackhoudini on the bitnob app \033[0m"

