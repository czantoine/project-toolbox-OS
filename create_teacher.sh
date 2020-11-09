#!/bin/bash

echo -e "\nAdd new teacher user"

echo -e "\nEnter username"
read username

echo -e "\nEnter email"
read email

echo -e "\nEnter group"
read group

if [[ $REPLY =~ ^[Yy]$ ]]
then
	read group
fi

sudo groupadd $group
sudo groupadd teacher

sudo useradd $username --groups teacher,$group
sudo mkdir -p /home/$username
sudo chown $username:$username /home/$username
sudo usermod -d /home/$username $username

sudo cp toolbox_teacher.sh /home/$username
sudo cp grade.sh /home/$username

touch .email
echo "$email" >> .email
sudo cp .email /home/$username
rm .email

sudo mkdir -m 770 /home/$username/ARCHIVE
cd /home/$username
sudo chgrp $group ARCHIVE

echo -e "\nSet password for this teachery"
sudo passwd $username

echo -e "\nUser created $username"
