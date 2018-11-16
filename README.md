# Install-Script-For-New-Servers
To use the Script use :
`bash -c "$(wget -qO - https://raw.githubusercontent.com/IIPoliII/Install-Script-For-New-Servers/master/Script/Install.sh)"`

This Script is for my personal use for the packages i use when i create a new server.
It can only work under Ubuntu, Debian, Rasbiann, and debian distros with APT.

It will install : openssh-server wget curl sudo git nano sed libssl-dev libpam0g-dev zlib1g-dev dh-autoreconf software-properties-common speedtest-cli apache2 proftpd screen php.
And it will put the root user in the sudo group.

It makes you a folder with a file browser, and also a status website for your games (who need to be configured but it creates the subdomain and folder)

Then you can install a minecraft Server with spigot.
And you can also install a Plex server
I am devloping the Transmission-deamon installtion part now.
