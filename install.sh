#!/bin/bash

ext=0

while [ "$ext" = 0 ]; do

echo "1. Install ssh"
echo "2. Install gnuplot"
echo "3. Install ssmtp"
echo "4. Update & Upgrade"
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

elif [[ $choice -eq 4 ]]
then
	sudo apt update
	sudo apt upgrade

else
	exit 1
fi
done
