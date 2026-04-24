#!/bin/bash

echo "choose option :"
echo "1) Dev"
echo "2) CTF"
read choice

if [[ "$choice" == "1" ]];
then 
    echo "Installing Dev configuration..."
    source Module/Dev.sh
elif [[ "$choice" == "2" ]];
then
    echo "Installing CTF configuration..."
    source Module/CTF.sh
else
    echo "Invalid input"
fi
