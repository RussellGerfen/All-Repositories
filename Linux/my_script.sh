#!/bin/bash


name='jake'
echo "Hello $name."
echo -e "\n This is my script. \n"
echo -e "The files in $PWD are: \n $(ls)"
echo -e "\n copying the passwd file to your current directory. \n"
cp  /etc/passwd $PWD
echo -e "the files in your present directory are now: \n $(ls)"
echo " "
echo "have a great day!!"

