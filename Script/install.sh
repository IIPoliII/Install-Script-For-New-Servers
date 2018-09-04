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
	apt install -y openssh-server curl sudo git nano sed libssl-dev libpam0g-dev zlib1g-dev dh-autoreconf software-properties-common speedtest-cli apache2 proftpd screen 
	usermod -a -G sudo root
	apt update -y
	apt upgrade -y
	apt dist-upgrade -y
exit 0
}
Start_Install_One_One ()
{
	echo -e "\e[41mGood, installing one by one"
	echo -e "\e[41mIt's not recommanded to install packages one by one"
	echo -e "\e[41mIt can bring errors you can always stop the script with crtl+c and restart it"
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

        echo -ne "\e[41mDo you want to install git :"
        read sudo
        case $sudo in
   "yes")  apt install git ;;
   "Yes")  apt install git ;;
   "YES")  apt install git ;;
     "Y")  apt install git ;;
     "y")  apt install git ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac

        echo -ne "\e[41mDo you want to install nano :"
        read nano
        case $nano in
   "yes")  apt install nano ;;
   "Yes")  apt install nano ;;
   "YES")  apt install nano ;;
     "Y")  apt install nano ;;
     "y")  apt install nano ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac

        echo -ne "\e[41mDo you want to install sed :"
        read sed
        case $sed in
   "yes")  apt install sed ;;
   "Yes")  apt install sed ;;
   "YES")  apt install sed ;;
     "Y")  apt install sed ;;
     "y")  apt install sed ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac

        echo -ne "\e[41mDo you want to install libssl-dev :"
        read libssldev
        case $libssldev in
   "yes")  apt install libssl-dev ;;
   "Yes")  apt install libssl-dev ;;
   "YES")  apt install libssl-dev ;;
     "Y")  apt install libssl-dev ;;
     "y")  apt install libssl-dev ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac

        echo -ne "\e[41mDo you want to install libpam0g-dev :"
        read libpamgdev
        case $livpamgdev in
   "yes")  apt install libpam0g-dev ;;
   "Yes")  apt install libpam0g-dev ;;
   "YES")  apt install libpam0g-dev ;;
     "Y")  apt install libpam0g-dev ;;
     "y")  apt install libpam0g-dev ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac

        echo -ne "\e[41mDo you want to install zlib1g-dev :"
        read zlib1gdev
        case $zlib1gdev in
   "yes")  apt install zlib1g-dev ;;
   "Yes")  apt install zlib1g-dev ;;
   "YES")  apt install zlib1g-dev ;;
     "Y")  apt install zlib1g-dev ;;
     "y")  apt install zlib1g-dev ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac
        echo -ne "\e[41mDo you want to install dh-autoreconf :"
        read dhautoreconf
        case $dhautoreconf in
   "yes")  apt install dh-autoreconf ;;
   "Yes")  apt install dh-autoreconf ;;
   "YES")  apt install dh-autoreconf ;;
     "Y")  apt install dh-autoreconf ;;
     "y")  apt install dh-autoreconf ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac

        echo -ne "\e[41mDo you want to install software-properties-common :"
        read softwarepropertiescommon
        case $softwarepropertiescommon in
   "yes")  apt install software-properties-common ;;
   "Yes")  apt install software-properties-common ;;
   "YES")  apt install software-properties-common ;;
     "Y")  apt install software-properties-common ;;
     "y")  apt install software-properties-common ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac

        echo -ne "\e[41mDo you want to install speedtest-cli :"
        read speedtestcli
        case $speedtestcli in
   "yes")  apt install speedtest-cli ;;
   "Yes")  apt install speedtest-cli ;;
   "YES")  apt install speedtest-cli ;;
     "Y")  apt install speedtest-cli ;;
     "y")  apt install speedtest-cli ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac

        echo -ne "\e[41mDo you want to install apache2 :"
        read apache2
        case $apache2 in
   "yes")  apt install apache2 ;;
   "Yes")  apt install apache2 ;;
   "YES")  apt install apache2 ;;
     "Y")  apt install apache2 ;;
     "y")  apt install apache2 ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac

        echo -ne "\e[41mDo you want to install proftpd :"
        read proftpd
        case $proftpd in
   "yes")  apt install proftpd ;;
   "Yes")  apt install proftpd ;;
   "YES")  apt install proftpd ;;
     "Y")  apt install proftpd ;;
     "y")  apt install proftpd ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac

        echo -ne "\e[41mDo you want to install screen :"
        read screen
        case $screen in
   "yes")  apt install screen ;;
   "Yes")  apt install screen ;;
   "YES")  apt install screen ;;
     "Y")  apt install screen ;;
     "y")  apt install screen ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac

        echo -ne "\e[41mDo you want to install ShellInABox (!!!! Will install OpenSSL) :"
        read shellinabox
        case $shellinabox in
   "yes")  apt install openssl shellinabox ;;
   "Yes")  apt install openssl shellinabox ;;
   "YES")  apt install openssl shellinabox ;;
     "Y")  apt install openssl shellinabox ;;
     "y")  apt install openssl shellinabox ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac
        echo -ne "\e[41mDo you want to run Update & Upgrade & Clean Cache of upgrade :"
        read update
        case $update in
   "yes")  apt update -y && apt upgrade -y && apt dist-upgrade -y  ;;
   "Yes")  apt update -y && apt upgrade -y && apt dist-upgrade -y  ;;
   "YES")  apt update -y && apt upgrade -y && apt dist-upgrade -y  ;;
     "Y")  apt update -y && apt upgrade -y && apt dist-upgrade -y  ;;
     "y")  apt update -y && apt upgrade -y && apt dist-upgrade -y  ;;
    "NO") echo "Won't be installed" ;;
    "No") echo "Won't be installed" ;;
     "n") echo "Won't be installed" ;;
     "N") echo "Won't be installed" ;;
    "no") echo "Won't be installed" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac
./Fish/fish.sh

exit 0
}
Yes_No

