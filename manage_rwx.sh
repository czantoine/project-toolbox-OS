#!/bin/bash

ext=0

while [ "$ext" = 0 ]; do

echo -e "\n1. Show all user"
echo "2. Associate group on my cours"
echo "0. Exit"

echo "Enter your choice"
read choice

if [[ $choice -eq 1 ]]
then
	all_name=$(grep 'student' /etc/group | sort)
	clear_group=$(echo $all_name | sed 's/.*://')
	echo -e "\nThis all user"
	echo -e "\n$clear_group"
	echo -e "\n"
	echo -e "Show specif group of user"
	echo -e "What is the user you want? "
	read user
	show=$(groups $user)
	echo -e "\n$show"


elif [[ $choice -eq 2 ]]
then
	echo -e "\n What is semester you want go ?"
        read go_s
        echo -e "\n What is UE you want go ?"
        read go_ue
        echo -e "\n What is MO you want go ?"
        read go_mo
        echo -e "\n What is course you want go ?"
        read go_c

        echo -e "\n What is the group you want add ?"
        read group_add

	echo -e "\n You want give acces for file or dir ?"
	read rep
	if [[ $rep = Dir ]] || [[ $rep = dir ]] || [[ $rep = d ]]
        then

	chgrp $group_add $go_s
        chgrp $group_add $go_s/$go_ue
        chgrp $group_add $go_s/$go_ue/$go_mo
        chgrp $group_add $go_s/$go_ue/$go_mo/$go_c

        chmod 710 $go_s
        chmod 710 $go_s/$go_ue
        chmod 710 $go_s/$go_ue/$go_mo
        chmod 770 $go_s/$go_ue/$go_mo/$go_c

	username=$USER
	NOW=$(date +"%d-%m-%Y-%r")
	username_group=$(id -Gn $username)
	echo "################################" >> rwx.conf
	echo "Write at : $NOW" >> rwx.conf
	echo "$username add : for $group_add $go_s/$go_ue/$go_mo/$go_c" >> rwx.conf

	elif [[ $rep = File ]] || [[ $rep = file ]] || [[ $rep == f ]]
	then

        chgrp $group_add $go_s
        chgrp $group_add $go_s/$go_ue
        chgrp $group_add $go_s/$go_ue/$go_mo
        chgrp $group_add $go_s/$go_ue/$go_mo/$go_c
	chgrp $group_add $go_s/$go_ue/$go_mo/$go_c/$file

        chmod 710 $go_s
        chmod 710 $go_s/$go_ue
        chmod 710 $go_s/$go_ue/$go_mo
        chmod 710 $go_s/$go_ue/$go_mo/$go_c
	chmod 770 $go_s/$go_ue/$go_mo/$go_c/$file

	username=$USER
        NOW=$(date +"%d-%m-%Y-%r")
        username_group=$(id -Gn $username)
        echo "################################" >> rwx.conf
        echo "Write at : $NOW" >> rwx.conf
        echo "$username add : for $group_add $go_s/$go_ue/$go_mo/$go_c" >> rwx.conf

	else
		echo "error"
	fi
else
	exit 1
fi
done
