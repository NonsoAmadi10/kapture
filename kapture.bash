#!/bin/bash 

RED='\033[0;31m'
BLUE='\033[40;38;5;82m'
PURPLE='\033[0;35m'

NOON=12

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


echo "${PURPLE} ***** Creating User Config ***** \033[35m "

mkdir ~/.config

sleep 2

echo -e "${BLUE} ******** Installing doctl ********* \033[40m"

sudo snap install doctl

sleep 2


echo -e "{BLUE} ----- Authenticating DO User ----- \033[40m"

doctl auth init 

sleep 1


echo -n "Please enter the ID of the digital ocean droplet you want to Kapture: ";
read DROPLET_ID;

echo "checking to see if droplet exist "

if [[ ! -z $( doctl compute droplet list | awk /$DROPLET_ID/{print}) ]]

then 
    echo -n "At what time do you want this kapture to run?"
    read TIME;
    echo "Creating automated snapshots on your droplet. Please Wait..."

    crontab -l | { cat; echo "0 $TIME * * * doctl compute droplet-action snapshot $DROPLET_ID --snapshot-name New --wait"; } | crontab -

    if [[ "$TIME" -lt "$NOON" ]]
    echo "Automatic backup created!! It will run everyday at $TIME:00am"
    else 
    echo "Automatic snapshot created!! It will run everday at $TIME:00pm"
    fi
    sleep 2

    echo Done
else
    echo -e "${RED} Droplets does not exist!! Kapture Not possible"
fi 


echo -e " ${BLUE} Send me bitcoin @jackhoudini on the bitnob app \033[0m";

