#!/bin/bash
THEME="construct-plymouth"
PREFIX="[construct-plymouth]"

construct_echo() {
    echo -e "$PREFIX $@"
}

#Check if run with priviliges
if [ $EUID -ne 0 ]
then
    construct_echo "This script requires sudo priviliges."
    exit
fi

construct_echo ""
construct_echo "\t|------------------|"
construct_echo "\t|construct-plymouth|  by Olocool17"
construct_echo "\t|------------------|"
construct_echo ""
construct_echo "Theme to be installed: ${THEME}"

PLYMOUTH_THEME_DIR="/usr/share/plymouth/themes"

if [ ! -d ${PLYMOUTH_THEME_DIR} ]
then
    construct_echo "Directory ${PLYMOUTH_THEME_DIR} does not exist."
    exit
fi

construct_echo "Deleting old theme directory..."
sudo rm -r  ${PLYMOUTH_THEME_DIR}/${THEME}

construct_echo "Making theme directory..."
sudo mkdir -p ${PLYMOUTH_THEME_DIR}/${THEME}

construct_echo "Copying ${THEME} to previously created directory"
sudo cp -r ${THEME}-theme/* ${PLYMOUTH_THEME_DIR}/${THEME} 

construct_echo "Setting Plymouth theme to ${THEME}"
sudo plymouth-set-default-theme -R ${THEME}
exit