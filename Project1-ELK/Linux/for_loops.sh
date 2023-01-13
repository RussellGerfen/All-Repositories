#!/bin/bash


# for <item> in <list>
# do
#   <run_this_command>
#   <run_this_command>
# done


# variables
states=('California' 'NewYork' 'Utah' 'Colorado' 'Hawaii')

nums=$(seq 0 9)

execs=$(find /home -type f -perm 777 2> /dev/null)

ls_out=$(ls)

output=(~/compound_activities/act3/sys_info.txt)

files=('/etc/shadow' '/etc/passwd')


# create loop for hawaii
for state in ${states[@]};
do
  if [ $state == 'Hawaii' ]
  then
    echo "Hawaii is the Best!"
  else
    echo "im not fond of Hawaii"
  fi
done

#create loop for nums 3 5 7
for num in ${nums[@]};
do
   if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ]
   then
     echo $num
   fi
done

# create loop to list exec files
for x in ${ls_out[@]};
do
   echo $x >> $output
done


# permissions of shadow and passwd files
echo -e "\nThe permissions for the sensitive /etc files are: \n" >> $output
for file in ${files[@]};
do
   ls -l $file >> $output
done







#checking privlidges for users in home

