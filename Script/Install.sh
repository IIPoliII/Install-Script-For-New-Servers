#!/bin/bash
# Made by Poli
if [ "$USER" = "root" ]; then
    apt install screen -y
    mkdir /home/temp
    cd /home/temp
    wget https://raw.githubusercontent.com/IIPoliII/Install-Script-For-New-Servers/master/Script/InstallAll.sh
    chmod +x InstallAll.sh
    screen ./InstallAll.sh
    cd ..
    rm -r /home/temp
else
    echo "Run this script as root or using sudo in the front of it !"
fi
rm -rf /home/temp
echo "Script Finished"
service ssh restart
echo "SSH service restarted you maybe need to reconnect"
