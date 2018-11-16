#!/bin/bash
# Made by Poli
Domain=""
Admin=""
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
	apt install -y openssh-server wget curl sudo git nano sed libssl-dev libpam0g-dev zlib1g-dev dh-autoreconf software-properties-common speedtest-cli apache2 proftpd screen php
	usermod -a -G sudo root
	apt update -y
	apt upgrade -y
	apt dist-upgrade -y
exit 0
}
Yes_No
echo "Please enter your domain name (none won't create the subdomains in apache):"
read Domain
if [[ $Domain == "" ]]
then
echo "No domain used"
else
echo "Enter the admin mail :"
read Admin
if [[ $Admin -eq "" ]]
then
echo "Using default Mail Admin :"
Admin=webmaster@localhost
echo $Admin
fi
echo "The Final admin mail is : $Admin"
echo "Do you want to configure the web download directory ?"
read -p ":" -n 1 -r
     if [[ ! $REPLY =~ ^[Yy]$ ]]
	 then
	 echo "Ok configuring ........"
	 mkdir /var/www/download
	 chmod 777 /var/www/download
	 echo "<VirtualHost *:80>" > etc/apache2/sites-avalible/download.${Domain}
	 echo "    ServerAdmin ${Admin}" >> etc/apache2/sites-avalible/download.${Domain}
	 echo "    DocumentRoot /var/www/download" >> etc/apache2/sites-avalible/download.${Domain}
	 echo "    ErrorLog ${APACHE_LOG_DIR}/error.log" >> etc/apache2/sites-avalible/download.${Domain}
	 echo "    CustomLog ${APACHE_LOG_DIR}/access.log combined" >> etc/apache2/sites-avalible/download.${Domain}
	 echo "    ServerName download.${Domain}" >> etc/apache2/sites-avalible/download.${Domain}
	 echo "    ServerAlias www.download.${Domain}" >> etc/apache2/sites-avalible/download.${Domain}
	 echo "</VirtualHost>" >> etc/apache2/sites-avalible/download.${Domain}	 
	 else
	 echo "Not configuring"
	 fi
echo "Do you want to configure the web status directory ?"
read -p ":" -n 1 -r
     if [[ ! $REPLY =~ ^[Yy]$ ]]
	 then
	 echo "Ok configuring ........"
	 mkdir /var/www/status
	 chmod 777 /var/www/status
	 echo "<VirtualHost *:80>" > etc/apache2/sites-avalible/status.${Domain}
	 echo "    ServerAdmin ${Admin}" >> etc/apache2/sites-avalible/status.${Domain}
	 echo "    DocumentRoot /var/www/status" >> etc/apache2/sites-avalible/status.${Domain}
	 echo "    ErrorLog ${APACHE_LOG_DIR}/error.log" >> etc/apache2/sites-avalible/status.${Domain}
	 echo "    CustomLog ${APACHE_LOG_DIR}/access.log combined" >> etc/apache2/sites-avalible/status.${Domain}
	 echo "    ServerName status.${Domain}" >> etc/apache2/sites-avalible/status.${Domain}
	 echo "    ServerAlias www.status.${Domain}" >> etc/apache2/sites-avalible/status.${Domain}
	 echo "</VirtualHost>" >> etc/apache2/sites-avalible/status.${Domain}	
	 else
	 echo "Not configuring"
	 fi
fi
echo "Do you want to install a minecraft server (with spigot)"
read -p ":" -n 1 -r
     if [[ ! $REPLY =~ ^[Yy]$ ]]
	 then
	 ./Script/Minecraft/spigotinstallscreen.sh
	 else
	 echo "Not installing"
	 fi
echo "Do you want to install a plex server"
read -p ":" -n 1 -r
     if [[ ! $REPLY =~ ^[Yy]$ ]]
	 then
	 bash -c "$(wget -qO - https://raw.githubusercontent.com/mrworf/plexupdate/master/extras/installer.sh)"
	 else
	 echo "Not installing"
	 fi