#!/bin/bash
cd--

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

sudo useradd $username --groups teacher,$group
sudo mkdir -p /home/$username
sudo chown $username:$username /home/$username
sudo usermod -d /home/$username $username

echo -e "\nSet password for this teachery"
sudo passwd $username

echo -e "\nUser created $username"