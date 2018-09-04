#!/bin/bash
# a yes/no function
# loop if not yes
# start Start_Install function when yes (case insesitive)
Yes_No ()
{
  # print question
  echo -n "Do you want to install everything : "

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
          echo "These apps will be installed one by one" ;;
    "No") exit 0
          echo "These apps will be installed one by one" ;;
     "n") exit 0
          echo "These apps will be installed one by one" ;;
     "N") exit 0
          echo "These apps will be installed one by one" ;;
    "no") exit 0 
	  echo "These apps will be installed one by one" ;;
    *)      echo "Please answer yes or no (y|n)" ; Yes_No ;;
  esac
}

# function that is started when answer is yes
Start_Install ()
{
  echo "Good, continuing installation"
exit 0
}
Yes_No

