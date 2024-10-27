#!/bin/bash

sudo apt-get update
sudo apt-get -y install python3.8-distutils
wget https://bootstrap.pypa.io/get-pip.py && sudo python3 get-pip.py
sudo DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:deadsnakes/ppa
sudo python3 -m pip install --yes -r requirements.txt

TABSIZE="set tabsize 4"
TABTOSPACES="set tabstospaces"

# File to edit
CONFIG_FILE="/etc/nanorc"

# Check if tabsize is already set
if ! grep -qF "$TABSIZE" "$CONFIG_FILE"; then
    echo "$TABSIZE" | sudo tee -a "$CONFIG_FILE" > /dev/null
    echo "Added tabsize setting to $CONFIG_FILE"
else
    echo "Tabsize setting already exists in $CONFIG_FILE"
fi

# Check if tabstospaces is already set
if ! grep -qF "$TABTOSPACES" "$CONFIG_FILE"; then
    echo "$TABTOSPACES" | sudo tee -a "$CONFIG_FILE" > /dev/null
    echo "Added tabstospaces setting to $CONFIG_FILE"
else
    echo "Tabstospaces setting already exists in $CONFIG_FILE"
fi

echo "Nano configuration updated."

sudo apt-get -y install bluetooth bluez bluez-tools

sudo cp 99-usb-serial.rules /etc/udev/rules.d/99-usb-serial.rules

sudo udevadm control --reload-rules

sudo udevadm trigger
