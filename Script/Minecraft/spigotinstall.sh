#!/bin/bash
name="Default Minecraft Server"
port=25565
player=20
view=10
maxram=1
minram=1
java -version
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
java -jar BuildTools.jar --rev latest
var=$(find -maxdepth 1 -name "spigot*.jar")
echo $var
var2="${var:2}"
echo $var2
echo "#!/bin/bash" > startinstall.sh
echo "java -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -jar $var2" >> startinstall.sh
chmod +rwx Spigot/*
chmod +x startinstall.sh
./startinstall.sh
echo "Enter the max ram used (in Gigabytes, write only number) :"
read maxram
if [[ $maxram -eq " " ]]
then
echo "Using default max ram size :"
maxram=1
echo $maxram
fi
echo "The Final max used ram is : $maxram G"
echo "Enter the min ram used (in Gigabytes, write only number) :"
read minram
if [[ $minram -eq " " ]]
then
echo "Using default min ram size :"
minram=1
echo $minram
fi
echo "The Final max used ram is : $minram G"
echo "Enter the Minecraft server name :"
read name
echo "Error Generated ? No worries !"
if [[ $name -eq " " ]]
then
echo "Using default name :"
name='Default Minecraft Server'
echo $name
fi
echo "The Final name is : $name"
echo "Enter the Minecraft Server Port [1-99999] :"
read port
if [[ $port -eq " " ]]
then
echo "Using default port :"
port=25565
echo $port
fi
echo "The Final port is : $port"
echo "Enter the max Minecraft players :"
read player
if [[ $player -eq " " ]]
then
echo "Using default Max player :"
player=20
echo $player
fi
echo "The Final max player is : $player"
echo "Enter the max Minecraft View Distance [2-32] :"
read view
if [[ $view -eq " " ]]
then
echo "Using default max view distance :"
view=10
echo $view
fi
echo "The Final max view distance is : $view"
echo "server-port=$port" >> server.properties
echo "motd=$name" >> server.properties
echo "max-players=$player" >> server.properties
echo "view-distance=$view" >> server.properties
sed -i '3s/false/true/g' eula.txt
echo "#!/bin/bash" > start.sh
echo "screen -d -m -S MC ./startmc.sh" >> start.sh
echo "script /dev/null" >> start.sh
chmod +x start.sh
echo "#!/bin/bash" > startmc.sh
echo "java -Xms${minram}G -Xmx${maxram}G -XX:+UseConcMarkSweepGC -jar $var2" >> startmc.sh
chmod +x startmc.sh
echo "To start the server use ./start.sh"
wget https://github.com/IIPoliII/Install-Script-For-New-Servers/raw/master/Script/Minecraft/Dynmap.jar
chmod +x Dynmap.jar
mv Dynmap.jar plugins/Dynmap.jar
exit
