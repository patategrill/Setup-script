#!/bin/bash
source config.conf

echo "Updating systeme..."
sudo apt update &> /dev/null

if [[ "$install_ghidra" == true ]]; then 
    if command -v ghidra &> /dev/null; then
        echo "Ghidra is already install"
    else
        echo "Installing Ghidra..."
        wget -O ghidra.zip https://github.com/NationalSecurityAgency/ghidra/releases/latest/download/ghidra.zip
        unzip ghidra.zip -d ghidra
        rm ghidra.zip
        sudo apt install default-jdk
        echo "./ghidra/ghidraRun" > run-ghidra.sh
    fi
fi

if [[ "$install_wordlist" == true ]]; then
    echo "Installing wordlist (rockyou)..."
    git clone https://github.com/RykerWilder/rockyou.txt.git
fi

if [[ "$install_wireshark" == true ]]; then
    if command -v wireshark &> /dev/null; then
        echo "Wireshark is already install"
    else
        echo "Installing Wireshark..."
        sudo apt install -y wireshark
    fi
fi
