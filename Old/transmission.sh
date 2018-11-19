#!/bin/bash
# Made by Poli
apt install transmission-daemon -y
sudo useradd -d /home/downloader -m downloader
sudo usermod -a -G debian-transmission downloader
sudo passwd downloader
sudo mkdir /var/download
sudo chown -R downloader:debian-transmission /home/downloader
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
    "utp-enabled": true'
echo $transmission > /etc/transmission-daemon/settings.json
end='",'
username='   "rpc-username": "'
password='    "rpc-password": "'
downloadwebuser=''
downloadwebuserpass=''
echo "Write your webuser down (no special characters)"
read downloadwebuser
rpc-user="${username}${downloadwebuser}${end}"
echo "$rpc-user" >> /etc/transmission-daemon/settings.json
echo "Write your webuser password"
read downloadwebuserpass
rpc-pass="${password}${downloadwebuserpass}${end}"
echo "$rpc-pass" >> /etc/transmission-daemon/settings.json
echo '}' >> /etc/transmission-daemon/settings.json