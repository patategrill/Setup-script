#!/bin/bash

echo "Choose option :"
echo "1) Dev"
echo "2) CTF"
echo "3) Office Software"
read choice1

if [[ "$choice1" == "1" ]];
then 
    echo "Choose setup mode :"
    echo "1) Minimal"
    echo "2) All"
    read choice2
    if [[ "$choice2" == "1" ]];
    then
        read -p "What is your linux distribution ? (For Ubuntu,Debian,Mint,Pop!_OS write 'apt' For Arch,Manjaro,EndeavourOS write 'pacman' For Fedora write 'dnf') " distro 
        sed -i "s/distro=\"\"/distro=\"$distro\"/g" config/configDev.conf
        echo "Installing Minimal Dev configuration..."
        source Module/DevMinimal.sh
    elif [[ "$choice2" == "2" ]];
    then
        read -p "What is your linux distribution ? (For Ubuntu,Debian,Mint,Pop!_OS write 'apt' For Arch,Manjaro,EndeavourOS write 'pacman' For Fedora write 'dnf') " distro 
        sed -i "s/distro=\"\"/distro=\"$distro\"/g" config/configDev.conf
        echo "Installing All Dev configuration..."
        source Module/DevAll.sh
    else
        echo "Invalid input"
    fi
elif [[ "$choice1" == "2" ]];
then
    echo "Choose setup mode :"
    echo "1) Minimal"
    echo "2) All"
    read choice2  
    if [[ "$choice2" = "1" ]];
    then  
        read -p "What is your linux distribution ? (For Ubuntu,Debian,Mint,Pop!_OS write 'apt' For Arch,Manjaro,EndeavourOS write 'pacman' For Fedora write 'dnf') " distro 
        sed -i "s/distro=\"\"/distro=\"$distro\"/g" config/configCTF.conf
        echo "Installing Minimal CTF configuration..."
        source Module/CTFMinimal.sh
    elif [[ "$choice2" == "2" ]];
    then
        read -p "What is your linux distribution ? (For Ubuntu,Debian,Mint,Pop!_OS write 'apt' For Arch,Manjaro,EndeavourOS write 'pacman' For Fedora write 'dnf') " distro 
        sed -i "s/distro=\"\"/distro=\"$distro\"/g" config/configCTF.conf
        echo "Installing All CTF configuration..."
        source Module/CTFAll.sh
    else
        echo "Invalid input"
    fi
elif [[ "$choice1" == "3" ]];
then
    echo "Choose setup mode :"
    echo "1) Minimal"
    echo "2) All"
    read choice2
    if [[ "$choice2" == "1" ]];
    then
        read -p "What is your linux distribution ? (For Ubuntu,Debian,Mint,Pop!_OS write 'apt' For Arch,Manjaro,EndeavourOS write 'pacman' For Fedora write 'dnf') " distro 
        sed -i "s/distro=\"\"/distro=\"$distro\"/g" config/configOffice.conf
        echo "Installing Minimal Office Software configuration..."
        source Module/OfficeSoftwareMinimal.sh
    elif [[ "$choice2" == "2" ]];
    then
        read -p "What is your linux distribution ? (For Ubuntu,Debian,Mint,Pop!_OS write 'apt' For Arch,Manjaro,EndeavourOS write 'pacman' For Fedora write 'dnf') " distro 
        sed -i "s/distro=\"\"/distro=\"$distro\"/g" config/configOffice.conf
        echo "Installing All Office Software configuration..."
        source Module/OfficeSoftwareAll.sh
    else
        echo "Invalid input"
    fi
else
    echo "Invalid input"
fi
