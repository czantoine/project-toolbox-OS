#!/bin/bash

echo -e "\nWhat is user you want send file?"
read user

echo -e "\n Print all acces directory of user? TAP YES or NO :"
read ques

if [[ $ques = YES ]] || [[ $adel = yes ]] || [[ $adel = y ]]
then
	cat /home/$user/rwx.conf
fi

echo -e "\n Add work file for send it :"
echo -e "\n What is semester you want go ?"
read go_s
echo -e "\n What is UE you want go ?"
read go_ue
echo -e "\n What is MO you want go ?"
read go_mo
echo -e "\n What is course you want go ?"
read go_c
echo -e "\n What is name file you want send ?"
read name_file

echo -e "\n Where you want send :"
echo -e "\n What is semester you want go ?"
read rgo_s
echo -e "\n What is UE you want go ?"
read rgo_ue
echo -e "\n What is MO you want go ?"
read rgo_mo
echo -e "\n What is course you want go ?"
read rgo_c

if [ -d "$go_s/$go_ue/$go_mo/$go_c/" ]
then
	cp $go_s/$go_ue/$go_mo/$go_c/$name_file /home/$user/$rgo_s/$rgo_ue/$rgo_mo/$rgo_c
	echo -e "\nFile have been send and received for $user"
	exit 1
else
    echo "Error: Directory $go_s/$go_ue/$go_mo/$go_c/ does not exists."
fi




