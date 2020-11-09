#!/bin/bash

che=$(pwd)
ext=0

while [ "$ext" = 0 ]; do

echo -e "\n1. Show all user"
echo "2. Associate user on a cours"
echo "3. Associate group on a cours"
echo "4. Create new group for new team mate"
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
	echo -e "\n What is user you want go ?"
        read user_s
	echo -e "\n What is semester you want go ?"
        read go_s
        echo -e "\n What is UE you want go ?"
        read go_ue
        echo -e "\n What is MO you want go ?"
        read go_mo
        echo -e "\n What is course you want go ?"
        read go_c
        echo -e "\n What is the user you want add ?"
        read user_add

	echo -e "\n You want give acces for file or dir ?"
	read rep
	if [[ $rep = Dir ]] || [[ $rep = dir ]] || [[ $rep = d ]]
        then
	cd /home/$user_s/
	sudo chown $user_add $go_s
        sudo chown $user_add $go_s/$go_ue
        sudo chown $user_add $go_s/$go_ue/$go_mo
        sudo chown $user__add $go_s/$go_ue/$go_mo/$go_c

        sudo chmod 700 $go_s
        sudo chmod 700 $go_s/$go_ue
        sudo chmod 700 $go_s/$go_ue/$go_mo
        sudo chmod 700 $go_s/$go_ue/$go_mo/$go_c

	cd $che
	username=$USER
	NOW=$(date +"%d-%m-%Y-%r")
	username_group=$(id -Gn $username)
	echo "################################" >> rwx.conf
	echo "Write at : $NOW" >> rwx.conf
	echo "$username add : for /home/$user_s/$user_add $go_s/$go_ue/$go_mo/$go_c" >> rwx.conf

	elif [[ $rep = File ]] || [[ $rep = file ]] || [[ $rep == f ]]
	then
	cd /home/$user_s/
        sudo  chown $user_add $go_s
        sudo  chown $user_add $go_s/$go_ue
        sudo chown $user_add $go_s/$go_ue/$go_mo
        sudo chown $user_add $go_s/$go_ue/$go_mo/$go_c
	sudo chown $user_add $go_s/$go_ue/$go_mo/$go_c/$file

        sudo chmod 700 $go_s
        sudo chmod 700 $go_s/$go_ue
        sudo chmod 700 $go_s/$go_ue/$go_mo
        sudo chmod 700 $go_s/$go_ue/$go_mo/$go_c
	sudo chmod 700 $go_s/$go_ue/$go_mo/$go_c/$file

	cd $che
	username=$USER
        NOW=$(date +"%d-%m-%Y-%r")
        username_group=$(id -Gn $username)
        echo "################################" >> rwx.conf
        echo "Write at : $NOW" >> rwx.conf
        echo "$username add : for $user_add $go_s/$go_ue/$go_mo/$go_c" >> rwx.conf

	else
		echo "error"
	fi

elif [[ $choice -eq 3 ]]
then
	echo -e "\n What is user you want go ?"
        read user_s
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
	cd /home/$user_s/
	sudo chgrp $group_add $go_s
        sudo chgrp $group_add $go_s/$go_ue
        sudo chgrp $group_add $go_s/$go_ue/$go_mo
        sudo chgrp $group_add $go_s/$go_ue/$go_mo/$go_c

        sudo chmod 710 $go_s
        sudo chmod 710 $go_s/$go_ue
        sudo chmod 710 $go_s/$go_ue/$go_mo
        sudo chmod 770 $go_s/$go_ue/$go_mo/$go_c

	cd $che
	username=$USER
	NOW=$(date +"%d-%m-%Y-%r")
	username_group=$(id -Gn $username)
	echo "################################" >> rwx.conf
	echo "Write at : $NOW" >> rwx.conf
	echo "$username add : for /home/$user_s/$group_add $go_s/$go_ue/$go_mo/$go_c" >> rwx.conf

	elif [[ $rep = File ]] || [[ $rep = file ]] || [[ $rep == f ]]
	then
	cd /home/$user_s/
        sudo chgrp $group_add $go_s
        sudo chgrp $group_add $go_s/$go_ue
        sudo chgrp $group_add $go_s/$go_ue/$go_mo
        sudo chgrp $group_add $go_s/$go_ue/$go_mo/$go_c
	sudo chgrp $group_add $go_s/$go_ue/$go_mo/$go_c/$file

        sudo chmod 710 $go_s
        sudo chmod 710 $go_s/$go_ue
        sudo chmod 710 $go_s/$go_ue/$go_mo
        sudo chmod 710 $go_s/$go_ue/$go_mo/$go_c
	sudo chmod 770 $go_s/$go_ue/$go_mo/$go_c/$file

	cd $che
	username=$USER
        NOW=$(date +"%d-%m-%Y-%r")
        username_group=$(id -Gn $username)
        echo "################################" >> rwx.conf
        echo "Write at : $NOW" >> rwx.conf
        echo "$username add : for $group_add $go_s/$go_ue/$go_mo/$go_c" >> rwx.conf

	else
		echo "error"
	fi
elif [[ $choice -eq 4 ]]
then
	echo -e "\n Create a new group team mate :"
        read new_team_mate
        sudo groupadd $new_team_mate
        echo "Who many people you want add in new group team mate ?"
        read digit

        for(( i = 0 ; i < digit ; i++ )); do
                echo -e "\n What is username of team mate ?"
                read mate
                sudo usermod -g $new_team_mate $mate

		cd $che
        	NOW=$(date +"%d-%m-%Y-%r")
        	echo "################################" >> rwx.conf
        	echo "Write at : $NOW" >> rwx.conf
        	echo "$mate have been add to new group : $new_team_mate" >> rwx.conf

        done
else
	exit 1
fi
done
