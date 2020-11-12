#!/bin/bash

ext=0

while [ "$ext" = 0 ]; do

echo "1. Install ssh"
echo "2. Install gnuplot"
echo "3. Install ssmtp"
echo "4. Update & Upgrade"
echo "5. Server ip"
echo "0. Exit"

echo "Enter your choice"
read choice

if [[ $choice -eq 1 ]]
then
	sudo apt install openssh-server
	sudo systemctl restart sshd.service
	sudo systemctl enable ssh
	sudo systemctl start ssh
	sudo systemctl status ssh
elif [[ $choice -eq 2 ]]
then
	sudo apt install gnuplot
	sudo apt install gnuplot-x11

elif [[ $choice -eq 3 ]]
then
	sudo apt install ssmtp
	sudo apt install mailutils
	cd file_system
	sudo cat ssmtp.conf > /etc/ssmtp/ssmtp.conf

elif [[ $choice -eq 4 ]]
then
	sudo apt update
	sudo apt upgrade

elif [[ $choice -eq 5 ]]
then
	echo -e "\nActuel server ip is : "
	cat file_system/.numserver
	echo -e "\nNeed change the address ? TAP YES or NO "
	read rep
	if [[ $rep = YES ]] || [[ $rep = yes ]] || [[ $rep == NO ]]
	then
		echo -e "\nWhat is the need ip address ? "
		read new_ip
		echo $new_ip > file_system/.numserver
		echo -e "\nip have been change : $new_ip"
else

	exit 1
fi
done
