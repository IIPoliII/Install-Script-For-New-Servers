#!/bin/bash
# Made by Poli
if [ "$USER" = "root" ]
then
apt install screen -y
mkdir temp
cd temp
wget https://raw.githubusercontent.com/IIPoliII/Install-Script-For-New-Servers/master/Script/InstallAll.sh
chmod +x InstallAll.sh
screen ./InstallAll.sh
cd ..
rm -r temp
else
echo "Run this script as root !"
fi
echo "Script Finished"
