#!/bin/bash
apt update
apt install screen -y
wget https://raw.githubusercontent.com/IIPoliII/Install-Script-For-New-Servers/master/Script/Minecraft/spigotinstall.sh
chmod +X spigotinstall.sh
screen ./spigotinstall.sh
echo "Finished run the server by going in the MC directory and make ./start.sh"
