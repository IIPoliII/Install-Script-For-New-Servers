#!/bin/bash
# a yes/no function
# loop if not yes
# start Start_Install function when yes (case insesitive)
message=$1
if [ -z "$1" ]
then
message=0
fi
Yes_No ()
{
  # print question
  echo -n "Do want to install FishShell: "

  # read answer
  read YnAnswer

  # all to lower case
  YnAnswer=$(echo $YnAnswer | awk '{print tolower($0)}')

  # check and act on given answer
  case $YnAnswer in
   "yes")  Start_Install ;;
   "Yes")  Start_Install ;;
   "YES")  Start_Install ;;
     "Y")  Start_Install ;;
     "y")  Start_Install ;;
    "NO") exit 0
          echo "This app won't be installed" ;;
    "No") exit 0
          echo "This app won't be installed" ;;
     "n") exit 0
          echo "This app won't be installed" ;;
     "N") exit 0
          echo "This app won't be installed" ;;
    "no") exit 0 
	  echo "This app won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac
}

# function that is started when answer is yes
Start_Install ()
{
  echo "Good, continuing installation"
        apt install fish -y
	./ohmyfish.fish
        sed -i 's/\/bin\/bash/\/usr\/bin\/fish/g' /etc/passwd
        echo "echo '-------------------------------------------'" > ~/.config/fish/config.fish
        echo "echo 'Current Local IP'" >> ~/.config/fish/config.fish
        echo "ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}'" >> ~/.config/fish/config.fish
        echo "echo '-------------------------------------------'" >> ~/.config/fish/config.fish
        echo "echo 'Current External IP'" >> ~/.config/fish/config.fish
        echo "curl ipecho.net/plain" >> ~/.config/fish/config.fish
        echo "echo ' ' " >> ~/.config/fish/config.fish
        echo "echo '-------------------------------------------'" >> ~/.config/fish/config.fish
        echo "echo 'Current Free/Used space'" >> ~/.config/fish/config.fish
        echo "df -h /home" >> ~/.config/fish/config.fish
        echo "echo '-------------------------------------------'" >> ~/.config/fish/config.fish
	bash;
exit 0
}

# ask the yes/no question

if [ "$message" = "0" ]
then
Yes_No
elif [ "$message" = "-y" ]
then
echo "Good, continuing installation"
        apt install fish -y
	./ohmyfish.fish
        sed -i 's/\/bin\/bash/\/usr\/bin\/fish/g' /etc/passwd
        echo "echo '-------------------------------------------'" > ~/.config/fish/config.fish
        echo "echo 'Current Local IP'" >> ~/.config/fish/config.fish
        echo "ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}'" >> ~/.config/fish/config.fish
        echo "echo '-------------------------------------------'" >> ~/.config/fish/config.fish
        echo "echo 'Current External IP'" >> ~/.config/fish/config.fish
        echo "curl ipecho.net/plain" >> ~/.config/fish/config.fish
        echo "echo ' ' " >> ~/.config/fish/config.fish
        echo "echo '-------------------------------------------'" >> ~/.config/fish/config.fish
        echo "echo 'Current Free/Used space'" >> ~/.config/fish/config.fish
        echo "df -h /home" >> ~/.config/fish/config.fish
        echo "echo '-------------------------------------------'" >> ~/.config/fish/config.fish
else
echo "Wrong parameters won't install fish"
fi

