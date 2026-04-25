#!/bin/bash
source ../Config/configOfficeSoftware.conf

echo "Updating systeme..."
sudo apt update &> /dev/null

#chromium
if [[ "$install_chromium" == true ]];
then
    if command -v chromium &> /dev/null;
    then
        echo "Chromium is already install"
    else
        echo "Installing Chromium..."
        sudo apt install -y chromium &> /dev/null
    fi
fi


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

if [[ "$install_obsidian" == true ]]; then
    if command -v obsidian &>/dev/null; then
        echo "Obsidian is already install"
    else
        echo "Installing Obsidian..."
        wget https://github.com/obsidianmd/obsidian-releases/releases/latest/download/Obsidian.AppImage
        chmod +x Obsidian.AppImage
        sudo ln -s /opt/obsidian.AppImage /usr/local/bin/obsidian
    fi
    echo "Obisidian installation successful"
fi
