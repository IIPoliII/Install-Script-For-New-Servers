#!/bin/bash
apt update
apt install screen -y
screen ./spigotinstall.sh
echo "Finished run the server by going in the MC directory and make ./start.sh"