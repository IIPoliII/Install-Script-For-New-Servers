#!/bin/bash
# Made by Poli
Yes_No ()
{
  # print question
  echo -e "\033[33mWelcome to Poli's server instllation tool\033[0m"
  echo -ne "\e[41mDo you want to install everything :"

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
    "NO") echo "These apps will be installed one by one"
	  Start_Install_One_One ;;
    "No") echo "These apps will be installed one by one"
	  Start_Install_One_One ;;
     "n") echo "These apps will be installed one by one"
	  Start_Install_One_One ;;
     "N") echo "These apps will be installed one by one"
	  Start_Install_One_One	;;
    "no") echo "These apps will be installed one by one"
	  Start_Install_One_One ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac
}

# function that is started when answer is yes
Start_Install ()
{
	echo -e "\e[41mGood, continuing installation"
  	apt update -y
	apt upgrade -y
	apt dist-upgrade -y
	apt install -y openssh-server curl sudo git nano sed libssl-dev libpam0g-dev zlib1g-dev dh-autoreconf libssl-dev libpam0g-dev zlib1g-dev dh-autoreconflibssl-dev libpam0g-dev zlib1g-dev dh-autoreconf software-properties-common speedtest-cli apache2 proftpd screen 
	usermod -a -G sudo root
	apt update -y
	apt upgrade -y
	apt dist-upgrade -y
exit 0
}
Start_Install_One_One ()
{
	echo -e "\e[41mGood, installing one by one"
        echo -ne "\e[41mDo you want to install the updates (Recommended) :"
        read update
        case $update in
   "yes")  apt update -y  ;;
   "Yes")  apt update -y  ;;
   "YES")  apt update -y  ;;
     "Y")  apt update -y  ;;
     "y")  apt update -y  ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac
        echo -ne "\e[41mDo you want to install the upgarde (Recommended) :"
        read upgarde
        case $upgarde in
   "yes")  apt upgrade -y  ;;
   "Yes")  apt upgrade -y  ;;
   "YES")  apt upgrade -y  ;;
     "Y")  apt upgrade -y  ;;
     "y")  apt upgrade -y  ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac

        echo -ne "\e[41mDo you want to clean the cache of the upgrades (Recommended) :"
        read distupgrade
        case $distupgrade in
   "yes")  apt dist-upgrade -y  ;;
   "Yes")  apt dist-upgrade -y  ;;
   "YES")  apt dist-upgrade -y  ;;
     "Y")  apt dist-upgrade -y  ;;
     "y")  apt dist-upgrade -y  ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac

	echo -ne "\e[41mDo you want to install openssh-server :"
 	read openssh
	case $openssh in
   "yes")  apt install openssh-server ;;
   "Yes")  apt install openssh-server ;;
   "YES")  apt install openssh-server ;;
     "Y")  apt install openssh-server ;;
     "y")  apt install openssh-server ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac
	echo -ne "\e[41mDo you want to install curl :"
        read curl
        case $curl in
   "yes")  apt install curl ;;
   "Yes")  apt install curl ;;
   "YES")  apt install curl ;;
     "Y")  apt install curl ;;
     "y")  apt install curl ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac

        echo -ne "\e[41mDo you want to install sudo :"
        read sudo
        case $sudo in
   "yes")  apt install sudo ;;
   "Yes")  apt install sudo ;;
   "YES")  apt install sudo ;;
     "Y")  apt install sudo ;;
     "y")  apt install sudo ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac


exit 0
}
Yes_No

