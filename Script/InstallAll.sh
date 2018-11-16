#!/bin/bash
# Made by Poli
Domain=""
Admin=""
Yes_No ()
{
  apt install git -y
  # print question
  echo -e "\033[33mWelcome to Poli's server instllation tool\033[0m"
  echo -ne "Do you want to install everything:"

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
	echo -e "Good, continuing installation"
  	apt update -y
	apt upgrade -y
	apt dist-upgrade -y
	apt install -y openssh-server wget curl sudo git nano sed libssl-dev libpam0g-dev zlib1g-dev dh-autoreconf software-properties-common speedtest-cli apache2 proftpd screen php htop
	usermod -a -G sudo root
	apt update -y
	apt upgrade -y
	apt dist-upgrade -y
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
echo "The Final admin mail is : $Admin (if there is an error now worries)"
echo "Do you want to configure the web download directory ?"
while true; do
    read -p "Type your answer (y,n,yes,no)?" yn
    case $yn in
        [Yy]* )  echo "Ok configuring ........"
				 apt install php git -y
				 git clone https://github.com/IIPoliII/Cute-File-Browser-Poli.git
				 mv Cute-File-Browser-Poli/ /var/www/download
				 chmod 777 /var/www/download
				 mkdir /var/www/html/download
				 chmod 777 /var/www/html/download
				 echo "<html lang="en">" > /var/www/html/download/index.html
				 echo "<head>" >> /var/www/html/download/index.html
				 echo "<title>Redirection.....</title>" >> /var/www/html/download/index.html
				 meta='<meta http-equiv="refresh" content="0; URL='
				 URL="http://download.${Domain}/"
				 end='">'
				 echo ${meta}${URL}${end} >> /var/www/html/download/index.html	
				 echo "</head>" >> /var/www/html/download/index.html
				 echo "<body>" >> /var/www/html/download/index.html
				 echo "Redirection vers l'explorateur de fichiers" >> /var/www/html/download/index.html
				 echo "</body>" >> /var/www/html/download/index.html
				 echo "</html>" >> /var/www/html/download/index.html
				 
				 echo '<VirtualHost *:80>' > /etc/apache2/sites-available/download.${Domain}.conf
				 echo "    ServerAdmin ${Admin}" >> /etc/apache2/sites-available/download.${Domain}.conf
				 echo "    DocumentRoot /var/www/download" >> /etc/apache2/sites-available/download.${Domain}.conf
				 echo "    ErrorLog ${APACHE_LOG_DIR}/error.log" >> /etc/apache2/sites-available/download.${Domain}.conf
				 echo "    CustomLog ${APACHE_LOG_DIR}/access.log combined" >> /etc/apache2/sites-available/download.${Domain}.conf
				 echo "    ServerName download.${Domain}" >> /etc/apache2/sites-available/download.${Domain}.conf
				 echo "    ServerAlias www.download.${Domain}" >> /etc/apache2/sites-available/download.${Domain}.conf
				 echo "    DirectoryIndex index.php" >> /etc/apache2/sites-available/download.${Domain}.conf
				 echo "</VirtualHost>" >> /etc/apache2/sites-available/download.${Domain}.conf
				 a2ensite download.${Domain}.conf
				 systemctl reload apache2; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo "Do you want to configure the web status directory ?"
while true; do
    read -p "Type your answer (y,n,yes,no)?" yn
    case $yn in
        [Yy]* ) 	 echo "Ok configuring ........"
					 mkdir /var/www/status
					 chmod 777 /var/www/status
					 echo '<VirtualHost *:80>' > /etc/apache2/sites-available/status.${Domain}.conf
					 echo "    ServerAdmin ${Admin}" >> /etc/apache2/sites-available/status.${Domain}.conf
					 echo "    DocumentRoot /var/www/status" >> /etc/apache2/sites-available/status.${Domain}.conf
					 echo "    ErrorLog ${APACHE_LOG_DIR}/error.log" >> /etc/apache2/sites-available/status.${Domain}.conf
					 echo "    CustomLog ${APACHE_LOG_DIR}/access.log combined" >> /etc/apache2/sites-available/status.${Domain}.conf
					 echo "    ServerName status.${Domain}" >> /etc/apache2/sites-available/status.${Domain}.conf
					 echo "    ServerAlias www.status.${Domain}" >> /etc/apache2/sites-available/status.${Domain}.conf
					 echo "    DirectoryIndex index.html" >> /etc/apache2/sites-available/status.${Domain}.conf
					 echo "</VirtualHost>" >> /etc/apache2/sites-available/status.${Domain}.conf
					 a2ensite status.${Domain}.conf
					 systemctl reload apache2; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
fi
while true; do
    read -p "Do you want to install a minecraft server (with spigot) ?" yn
    case $yn in
        [Yy]* ) bash -c "$(wget -qO - https://raw.githubusercontent.com/IIPoliII/Install-Script-For-New-Servers/master/Script/Minecraft/spigotinstallscreen.sh)"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
while true; do
    read -p "Do you want to install a plex server ?" yn
    case $yn in
        [Yy]* ) bash -c "$(wget -qO - https://raw.githubusercontent.com/mrworf/plexupdate/master/extras/installer.sh)"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
