# Install-Script-For-New-Servers
To use the Script use :
`sudo bash -c "$(wget -qO - https://raw.githubusercontent.com/IIPoliII/Install-Script-For-New-Servers/master/Script/Install.sh)"`

OR

As root use :
`bash -c "$(wget -qO - https://raw.githubusercontent.com/IIPoliII/Install-Script-For-New-Servers/master/Script/Install.sh)"`

:+1: A screen (virtual terminal) is created when running the script so if your ssh session expire you can reatach it and continue your installation with simply `screen +x` or if it doesnt' work use `screen -ls` then take your screen number like `20149` and make `screen -x 20149` and you are back at your installation !

This Script is for my personal use for the packages i use when i create a new server.
It can only work under Ubuntu, Debian, Raspbian, and debian distros with APT.

** IMPORTANT PLEX NOTE : **
For the first setup you need to create a ssh tunnel on putty it's easy just do this and open your session (watch the menu left) : ![Image](https://i.imgur.com/8LyUcid.png)

Then access to the web installer by typing in your browser : http://127.0.0.1:32400/web

It will install : openssh-server wget curl sudo git nano sed libssl-dev libpam0g-dev zlib1g-dev dh-autoreconf software-properties-common speedtest-cli apache2 proftpd screen php.
And it will put the root user in the sudo group.

It makes you a folder with a file browser, and also a status website for your games (who need to be configured but it creates the subdomain and folder)

It will also install you bash-it with the base theme for having a cutter linux ;3. 

We will install you Fail2Ban to prevent pepoles hacking you on port 22 (brut force SSH) after 3 tries the IP gets banned be careful don't get banned by failing 3 times to avoid it just add your ip after `127.0.0.1` in `/etc/fail2ban/jail.d/custom.conf` like that `ignore ip = 127.0.0.1 8.8.8.8` (8.8.8.8 is your ip).



And you can also install a Plex server.
It will configure you a transmission deamon client too.
Then you can choose in a list of 21 games servers :
 1) ARK Server
 2) CS:GO
 3) CSS
 4) Double Action
 5) ECO
 6) Factorio
 7) Fistful of Frags
 8) Garry's mod
 9) Insurgency
 10) Just Cause 2
 11) Just Cause 3
 12) Left 4 Dead 2
 13) Mumble
 14) Project Cars
 15) GTA San Andreas Multiplayer
 16) StarBound
 17) Stationeers
 18) Team Fortress 2
 19) TeamSpeak 3
 20) Don't Starve Together
 21) Rust
 22) Minecraft (with Spigot) and DynMap plugin (port 9123)
