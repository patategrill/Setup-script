#!/bin/bash
source ../Config/configOfficeSoftware.conf

#vscode
if [[ "$install_code" == true ]];
then
    if command -v code &> /dev/null;
    then
        echo "Vscode is already install"
    else
        echo "Installing Vscode..."
        wget -O vscode.tar.gz https://update.code.visualstudio.com/latest/linux-x64/stable &> /dev/null;
        tar -xzf vscode.tar.gz &> /dev/null
        rm vscode.tar.gz
        cd vscode
        mkdir data

        if [[ "$install_python_extension_for_vscode" == true ]];
        then
            code --install-extension ms-python.python
        fi

        if [[ "$install_run_extension_for_vscode" == true ]];
        then
            code --install-extension formulahendry.code-runner
        fi
    fi
    echo "Vscode and extension installation successful"
fi
