#!/bin/bash
source ../Config/configOfficeSoftware.conf

echo "Updating systeme..."
sudo apt update &> /dev/null

#libreOffice
if [[ "$install_LibreOffice" == true ]]; then
    if command -v libreoffice &> /dev/null; then
        echo "libreOffice is already install"
    else
        echo "Installing LibreOffice..."
        sudo apt install -y libreoffice
    fi
    echo "LibreOffice installation successful"
fi
