#!/bin/bash
# Made by Poli
Yes_No ()
{
  apt install git -y
  # print question
  echo -e "\033[33mWelcome to Poli's server instllation tool\033[0m"
  echo -ne "\e[41mDo you want to install everything (only yes for now is avalible):"

  # read answer
  read YnAnswer

  # all to lower case
  YnAnswer=$(echo $YnAnswer | awk '{print tolower($0)}')

  # check and act on given answer
  case $YnAnswer in
     "yes") Start_Install ;;
     "ye")  Start_Install ;;
     "y")   Start_Install ;;
     "n")   echo "These apps won't be installed" ;;
     "no")  echo "These apps won't be installed" ;;
     *)     echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac
}

# function that is started when answer is yes
Start_Install ()
{
	echo -e "\e[41mGood, continuing installation"
  	apt update -y
	apt upgrade -y
	apt dist-upgrade -y
	apt install -y openssh-server wget curl sudo git nano sed libssl-dev libpam0g-dev zlib1g-dev dh-autoreconf software-properties-common speedtest-cli apache2 proftpd screen 
	usermod -a -G sudo root
	apt update -y
	apt upgrade -y
	apt dist-upgrade -y
exit 0
}
Yes_No
echo "Do you want to install a minecraft server (with spigot)"
  read YnAnswer

  # all to lower case
  YnAnswer=$(echo $YnAnswer | awk '{print tolower($0)}')

  # check and act on given answer
  case $YnAnswer in
     "yes") ./Script/Minecraft/spigotinstallscreen.sh ;;
     "ye")  ./Script/Minecraft/spigotinstallscreen.sh ;;
     "y")   ./Script/Minecraft/spigotinstallscreen.sh ;;
     "n")   echo "The minecraft server won't be installed" ;;
     "no")  echo "The minecraft server won't be installed" ;;
     *)     echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac
  echo "Do you want to install a plex server"
  read YnAnswer

  # all to lower case
  YnAnswer=$(echo $YnAnswer | awk '{print tolower($0)}')

  # check and act on given answer
  case $YnAnswer in
     "yes") bash -c "$(wget -qO - https://raw.githubusercontent.com/mrworf/plexupdate/master/extras/installer.sh)" ;;
     "ye")  bash -c "$(wget -qO - https://raw.githubusercontent.com/mrworf/plexupdate/master/extras/installer.sh)" ;;
     "y")   bash -c "$(wget -qO - https://raw.githubusercontent.com/mrworf/plexupdate/master/extras/installer.sh)" ;;
     "n")   echo "The plex server won't be installed" ;;
     "no")  echo "The plex server won't be installed" ;;
     *)     echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac
mkdir /var/www
chmod 777 /home/download 