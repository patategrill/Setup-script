#!/bin/bash
source ../Config/configCTF.conf

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


#Git
if [[ "$install_git" == true ]]; then
    
    if command -v git &> /dev/null; then
        echo "Git is already install"
    else
        echo "Installing Git..."
        sudo apt install -y git &> /dev/null
    fi
    echo "Git installation successful"
fi


#Ghidra
if [[ "$install_ghidra" == true ]];
then 
    if command -v ghidra &> /dev/null;
    then
        echo "Ghidra is already install"
    else
        echo "Installing Ghidra..."
        wget -O ghidra.zip https://github.com/NationalSecurityAgency/ghidra/releases/latest/download/ghidra.zip &> /dev/null;
        unzip ghidra.zip -d ghidra
        rm ghidra.zip
        sudo apt install default-jdk &> /dev/null;
        echo "./ghidra/ghidraRun" > run-ghidra.sh
    fi
fi


#Wordlist(rockyou)
if [[ "$install_wordlist" == true ]];
then
    echo "Installing wordlist (rockyou)..."
    git clone https://github.com/RykerWilder/rockyou.txt.git &> /dev/null
fi

if [[ "$install_wireshark" == true ]];
then
    if command -v wireshark &> /dev/null;
    then
        echo "Wireshark is already install"
    else
        echo "Installing Wireshark..."
        sudo apt install -y wireshark &> /dev/null
    fi
    echo "Wireshark installation successful"
fi


#SqlMap
if [[ "$install_sqlmap" == true ]]; then
    if command -v sqlmap &> /dev/null; then
        echo "SqlMap is already install"
    else
        echo "Installing SqlMap..."
        sudo git clone https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap &> /dev/null;
        sudo ln -s /opt/sqlmap/sqlmap.py /usr/local/bin/sqlmap
        sudo chmod +x /opt/sqlmap/sqlmap.py
    fi
    echo "SqlMap installation successful"
fi


#Nmap
if [[ "$install_nmap" == true ]]; then
    if command -v nmap &> /dev/null; then
        echo "Nmap is already install"
    else
        echo "Installing Nmap..."
        sudo apt install nmap &> /dev/null
    fi
    echo "Nmap installation successful"
fi
