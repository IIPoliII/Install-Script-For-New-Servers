#!/bin/bash
# Made by Poli
apt install screen -y
mkdir tmp
cd tmp
wget https://raw.githubusercontent.com/IIPoliII/Install-Script-For-New-Servers/master/Script/InstallAll.sh
chmod +x InstallAll.sh
screen ./InstallAll.sh
cd ..
rm -r tmp
echo "Script Finished"