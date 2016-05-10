#!/usr/bin/env bash

# run using: source install_gtm_1.sh
# Must be root!

# Acknowledgements: Chris Edwards for the code below that checks 
#                   if running as root

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

echo 'Installing GT.M'

wget https://sourceforge.net/projects/fis-gtm/files/GT.M%20Installer/v0.13/gtminstall/download -O gtminstall.sh
source gtminstall.sh

echo 'Done!'
echo 'Now switch back to normal user and run: source install_gtm_2.sh'


