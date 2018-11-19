#!/bin/bash
# Made by Poli
Domain=""
Admin=""
passworduser=""
Yes_No ()
{
  apt install git -y
  # print question
  echo -e "\033[33mWelcome to Poli's server instllation tool\033[0m"
  echo -ne "Do you want to install everything:"
  cd /home
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
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
fi
while true; do
    read -p "Do you want to install a plex server ?" yn
    case $yn in
        [Yy]* ) bash -c "$(wget -qO - https://raw.githubusercontent.com/mrworf/plexupdate/master/extras/installer.sh)"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
while true; do
    read -p "Do you want to install a OpenVPN server ?" yn
    case $yn in
        [Yy]* ) bash -c "$(wget -qO - https://raw.githubusercontent.com/IIPoliII/Install-Script-For-New-Servers/master/Script/VPN/openvpn-install.sh)"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
while true; do
    read -p "Do you want to install a Transmission server ?" yn
    case $yn in
        [Yy]* ) echo "Ok configuring ........"
				 apt install php git transmission-daemon -y
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
				 systemctl reload apache2
				 apt install transmission-daemon -y
				 service transmission-daemon stop
				 useradd -d /var/www/download/Home/ -m downloader
				 usermod -a -G debian-transmission downloader
				 pass==$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
				 echo -e "${pass}\n${pass}" | passwd downloader
				 echo "The password of the downloader user is = $pass (Surely won't be used)"
				 chown -R downloader:debian-transmission /var/www/download/Home/
				 chmod 777 /var/www/download/Home/
				 rm /etc/transmission-daemon/settings.json
				 transmission='{
					"alt-speed-down": 50,
					"alt-speed-enabled": false,
					"alt-speed-time-begin": 540,
					"alt-speed-time-day": 127,
					"alt-speed-time-enabled": false,
					"alt-speed-time-end": 1020,
					"alt-speed-up": 50,
					"bind-address-ipv4": "0.0.0.0",
					"bind-address-ipv6": "::",
					"blocklist-enabled": false,
					"blocklist-url": "http://www.example.com/blocklist",
					"cache-size-mb": 4,
					"dht-enabled": true,
					"download-dir": "/var/www/download/Home/",
					"download-limit": 100,
					"download-limit-enabled": 0,
					"download-queue-enabled": true,
					"download-queue-size": 5,
					"encryption": 1,
					"idle-seeding-limit": 30,
					"idle-seeding-limit-enabled": false,
					"incomplete-dir": "/var/www/download/Home/incomplete",
					"incomplete-dir-enabled": true,
					"lpd-enabled": true,
					"max-peers-global": 500,
					"message-level": 1,
					"peer-congestion-algorithm": "",
					"peer-id-ttl-hours": 6,
					"peer-limit-global": 200,
					"peer-limit-per-torrent": 50,
					"peer-port": 51413,
					"peer-port-random-high": 65535,
					"peer-port-random-low": 49152,
					"peer-port-random-on-start": true,
					"peer-socket-tos": "default",
					"pex-enabled": true,
					"port-forwarding-enabled": false,
					"preallocation": 1,
					"prefetch-enabled": true,
					"queue-stalled-enabled": true,
					"queue-stalled-minutes": 30,
					"ratio-limit": 2,
					"ratio-limit-enabled": false,
					"rename-partial-files": true,
					"rpc-authentication-required": true,
					"rpc-bind-address": "0.0.0.0",
					"rpc-enabled": true,
					"rpc-host-whitelist": "",
					"rpc-host-whitelist-enabled": true,
					"rpc-password": "{2635c77990f9821434342d072e0385dc6495e7985rFbkrHE",
					"rpc-port": 9091,
					"rpc-url": "/transmission/",
					"rpc-whitelist": "127.0.0.1",
					"rpc-whitelist-enabled": false,
					"scrape-paused-torrents-enabled": true,
					"script-torrent-done-enabled": false,
					"script-torrent-done-filename": "",
					"seed-queue-enabled": false,
					"seed-queue-size": 10,
					"speed-limit-down": 100,
					"speed-limit-down-enabled": false,
					"speed-limit-up": 100,
					"speed-limit-up-enabled": false,
					"start-added-torrents": true,
					"trash-original-torrent-files": false,
					"umask": 18,
					"upload-limit": 100,
					"upload-limit-enabled": 0,
					"upload-slots-per-torrent": 14,
					"utp-enabled": true,'
				echo $transmission > /etc/transmission-daemon/settings.json
				end='",'
				end1='"'
				username='   "rpc-username": "'
				password='    "rpc-password": "'
				downloadwebuser=''
				downloadwebuserpass=''
				echo "Write your webuser down (no special characters)"
				read downloadwebuser
				echo "${username}${downloadwebuser}${end}" >> /etc/transmission-daemon/settings.json
				echo "Write your webuser password"
				read downloadwebuserpass
				echo "${password}${downloadwebuserpass}${end1}" >> /etc/transmission-daemon/settings.json
				echo '}' >> /etc/transmission-daemon/settings.json
				a2enmod  rewrite proxy proxy_http
				systemctl restart apache2
				echo '<VirtualHost *:80>' > /etc/apache2/sites-available/torrent.${Domain}.conf
				echo "        ServerName torrent.${Domain}" >> /etc/apache2/sites-available/torrent.${Domain}.conf
				echo '        RewriteEngine On' >> /etc/apache2/sites-available/torrent.${Domain}.conf
				echo '        RewriteRule ^/$ /web/ [L,R=301]' >> /etc/apache2/sites-available/torrent.${Domain}.conf
				echo '        ProxyPass / http://127.0.0.1:9091/transmission/' >> /etc/apache2/sites-available/torrent.${Domain}.conf
				echo '        ProxyPassReverse / http://127.0.0.1:9091/transmission/' >> /etc/apache2/sites-available/torrent.${Domain}.conf
				echo "</VirtualHost>" >> /etc/apache2/sites-available/torrent.${Domain}.conf
				a2ensite torrent.${Domain}.conf
				systemctl reload apache2
				service transmission-daemon start; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
while true; do
	echo -e "0) Don't install (Exit) \n 1) ARK Server \n 2) CS:GO \n 3) CSS \n 4) Double Action \n 5) ECO \n 6) Factorio \n 7) Fistful of Frags \n 8) Garry's mod \n 9) Insurgency \n 10) Just Cause 2 \n 11) Just Cause 3 \n 12) Left 4 Dead 2 \n 13) Mumble \n 14) Project Cars \n 15) GTA San Andreas Multiplayer \n 16) StarBound \n 17) Stationeers \n 18) Team Fortress 2 \n 19) TeamSpeak 3 \n 20) Don't Starve Together \n 21) Rust \n 22) Minecraft (with Spigot) \n"
    read -p "Do you want to install a any of the games SERVER from the list ?" yn
		if [[ $yn -eq "0" ]]
	then
	break
	fi
	apt update
	apt install sudo openssl -y
	usermod -a -G sudo root
	if [[ $passworduser -eq "" ]]
	then
	pass==$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
	echo "Enter a password for the users (random password : $pass)"
	read passworduser
	if [[ $passworduser -eq "" ]]
	then
	passworduser=$pass
	echo "Used password : $pass"
	fi
	fi
    case $yn in
		0 ) break;;
        1 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 -y
			useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) arkserver
			cd /home/arkserver
			runuser -l arkserver -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh arkserver'
			runuser -l arkserver -c './arkserver install'
			cd /home
			;;
		2 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 -y
			useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) csgoserver
			cd /home/csgoserver
			runuser -l csgoserver -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh csgoserver'
			runuser -l csgoserver -c './csgoserver install'
			cd /home
			;;
		3 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 -y
			useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) cssserver
			cd /home/cssserver
			runuser -l cssserver -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh cssserver'
			runuser -l cssserver -c './cssserver install'
			cd /home
			;;
		4 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 -y
			useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) dabserver
			cd /home/dabserver
			runuser -l dabserver -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh dabserver'
			runuser -l dabserver -c './dabserver install'
			cd /home
			;;
		5 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 mono-complete -y
			useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) ecoserver
			cd /home/ecoserver
			runuser -l ecoserver -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh ecoserver'
			runuser -l ecoserver -c './ecoserver install'
			cd /home
			;;
		6 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 xz-utils -y
			useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) fctrserver
			cd /home/fctrserver
			runuser -l fctrserver -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh fctrserver'
			runuser -l fctrserver -c './fctrserver install'
			cd /home
			;;
		7 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 -y
			useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) fofserver
			cd /home/fofserver
			runuser -l fofserver -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh fofserver'
			runuser -l fofserver -c './fofserver install'
			cd /home
			;;
		8 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 lib32tinfo5 -y
			useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) gmodserver
			cd /home/gmodserver
			runuser -l gmodserver -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh gmodserver'
			runuser -l gmodserver -c './gmodserver install'
			cd /home;;
		9 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 -y
			useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) insserver
			cd /home/insserver
			runuser -l insserver -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh insserver'
			runuser -l insserver -c './insserver install'
			cd /home
			;;
		10 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 -y
			 useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) jc2server
			 cd /home/jc2server
			 runuser -l jc2server -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh jc2server'
			 runuser -l jc2server -c './jc2server install'
			 cd /home
			 ;;
		11 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 -y
			 useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) jc3server
			 cd /home/jc3server
			 runuser -l jc3server -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh jc3server'
			 runuser -l jc3server -c './jc3server install'
			 cd /home
			 ;;
		12 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 -y
			 useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) l4d2server
			 cd /home/l4d2server
			 runuser -l l4d2server -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh l4d2server'
			 runuser -l l4d2server -c './l4d2server install'
			 cd /home
			 ;;
		13 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux -y
			 useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) mumbleserver
			 cd /home/mumbleserver
			 runuser -l mumbleserver -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh mumbleserver'
			 runuser -l mumbleserver -c './mumbleserver install'
			 cd /home
			 ;;
		14 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 -y
			 useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) pcserver
			 cd /home/pcserver
			 runuser -l pcserver -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh pcserver'
			 runuser -l pcserver -c './pcserver install'
			 cd /home
			 ;;
		15 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 -y
			 useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) sampserver
			 cd /home/sampserver
			 runuser -l sampserver -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh sampserver'
			 runuser -l sampserver -c './sampserver install'
			 cd /home
			 ;;
		16 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 -y
			 useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) sbserver
			 cd /home/sbserver
			 runuser -l sbserver -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh sbserver'
			 runuser -l sbserver -c './sbserver install'
			 cd /home
			 ;;
		17 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 zlib1g -y
			 useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) stserver
			 cd /home/stserver
			 runuser -l stserver -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh stserver'
			 runuser -l stserver -c './stserver install'
			 cd /home
			 ;;
		18 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 libcurl4-gnutls-dev:i386 libtcmalloc-minimal4:i386 -y
			 useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) tf2server
			 cd /home/tf2server
			 runuser -l tf2server -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh tf2server'
			 runuser -l tf2server -c './tf2server install'
			 cd /home
			 ;;
		19 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq libmariadb2 -y
			 useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) ts3server
			 cd /home/ts3server
			 runuser -l ts3server -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh ts3server'
			 runuser -l ts3server -c './ts3server install'
			 cd /home
			 ;;
		20 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 libcurl4-gnutls-dev:i386 -y
			 useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) dstserver
			 cd /home/dstserver
			 runuser -l dstserver -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh dstserver'
			 runuser -l dstserver -c './dstserver install'
			 cd /home
			 ;;
		21 ) sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 lib32z1 -y
			 useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) rustserver
			 cd /home/rustserver
			 runuser -l rustserver -c 'wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh rustserver'
			 runuser -l rustserver -c './rustserver install'
			 cd /home
			 ;;
		22 ) useradd -g users -m -s /bin/bash -p $(echo ${passworduser} | openssl passwd -1 -stdin) mcserver
			 cd /home/mcserver
			 runuser -l mcserver -c 'bash -c "$(wget -qO - https://raw.githubusercontent.com/IIPoliII/Install-Script-For-New-Servers/master/Script/Minecraft/spigotinstall.sh)"'
			 ;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo "Script Finished"
