#!/bin/bash

# variables
output=(~/compound_activities/act3/sys_info.txt)
ip=$(ip addr | grep inet | tail -2 | head -1)
execs=$(sudo find /home -type f -perm 777 2> /dev/null)
cpu=$(lscpu | grep CPU)
disk=$(df -H | head -2)

#list for later use
files=('/etc/shadow' '/etc/passwd')
commands=( 'date' 'uname -a' 'hostname -s' )

#check for root permissions
if [ $UID -ne 0 ]
then
   echo "you must not have sudo permissions to run this script"
   exit
fi

#makes research directory if needed
if [ ! -d ~/research ]
then
   mkdir ~/research
fi

#checks for output file
if [ -f $output ]
then
   rm $output
fi


#########################################################################################################
#start script

#Title
echo -e "A Quick System Audit Script \n" >> $output
echo "" >> $output

#command list results
for x in {0..2}
do
   results=$(${commands[$x]})
   echo -e "Results  of \"${commands[$x]})\" command:"
   echo $results
   echo ""
done

#display date
echo -e "Todays Date \n" >> $output
echo -e "$(date) \n" >> $output

#display machine type info
echo "Machine Type info:" >> $output
echo -e "$MACHTYPE \n" >> $output

#display uname
echo -e "Uname Info: $(uname -a) \n" >> $output
echo -e "IP Info:\n" $ip >> $output

#display hostname
echo -e "Host Name: $(hostname -s) \n" >> $output

#displaY dns info
echo -e "DNS Info:\n" >> $output
cat /etc/resolv.conf >> $output

#display free memory info
echo "Memory Info:" >> $output
echo "$(free)" >> $output

#display cpu info
echo "CPU Info:" >> $output
echo $cpu >> $output

#display disk usage
echo "Disk Usage:" >> $output
echo $disk >> $output

#display logged in user
echo "Users Logged In Currently Are: /n $(who -a) /n" >> $output

#display executive files
echo -e "/nExec Files:" >> $output
for exec in $execs;
do
   echo $exec >> $output
done

#display top proccesses
echo -e "/nTop Proccesses Running are:" >> $output
ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head >> $output

# permissions of shadow and passwd files
for file in ${files[@]};
do
   ls -l $file
done

#checking privlidges for users in home
echo -e "\nThe permissions for users are:/n" >> $output
for file in ${files[@]};
do
   ls -l $file >> $output
done

