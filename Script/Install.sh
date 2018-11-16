#!/bin/bash
# Made by Poli
apt install screen -y
screen "bash -c '$(wget -qO - https://raw.githubusercontent.com/IIPoliII/Install-Script-For-New-Servers/master/Script/InstallAll.sh)"'