#!/bin/bash
source config.conf

echo "Updating systeme..."
sudo apt update &> /dev/null

#chromium
if [[ "$install_chromium" == true ]]; then
    if command -v chromium &> /dev/null;
    then
        echo "Chromium is already install"
    else
        echo "Installing Chromium..."
        sudo apt install -y chromium
    fi
fi

#vscode
if [[ "$install_code" == true ]]; then
    if command -v code &> /dev/null;
    then
        echo "Vscode is already install"
    else
        echo "Installing Vscode..."
        wget -O vscode.tar.gz https://update.code.visualstudio.com/latest/linux-x64/stable
        tar -xzf vscode.tar.gz -d vscode
        rm vscode.tar.gz
        cd vscode
        mkdir data

        if [[ "$install_python_extension_for_vscode" == true ]]; then
            code --install-extension ms-python.python
        fi

        if [[ "$install_c_extension_for_vscode" == true ]]; then
            code --install-extension ms-vscode.cpptools
        fi

        if [[ "$install_run_extension_for_vscode" == true ]]; then
            code --install-extension formulahendry.code-runner
        fi
    fi
fi

#python3
if [[ "$install_python3" == true ]]; then
    if command -v python3 &> /dev/null; then 
        echo "Python is already install"
    else
        echo "Python is missing"
        read -p "Do you want to install it ? [yes or no] : " choice
        if [[ "$choice" == "yes" ]]; then
        echo "Installing python3..."
            sudo apt install -y python3
        elif [[ "$choice" == "y" ]]; then 
            echo "Please type yes"
        else
            echo "Installation cancelled"
        fi
    fi
fi

#NodeJS
if [[ "$install_nodejs" == true ]]; then

    if command -v node &> /dev/null; then
        echo "NodeJS is already install"
    else
        echo "NodeJS is missing"
        read -p "Do you want to install it ? [yes or non] :" choice
        if [[ "$choice" == "yes" ]]; then
        echo "Installing NodeJS..."
            sudo apt install -y node
        elif [[ "$choice" == "y" ]]; then 
            echo "Please type yes"
        else
            echo "Installation cancelled"
        fi
    fi

fi
