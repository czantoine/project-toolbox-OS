#!/bin/bash
cd --

echo -e "\nAdd new student user"

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

sudo useradd $username --groups student,$group
sudo mkdir -p /home/$username
sudo chown $username:$username /home/$username
sudo usermod -d /home/$username $username
#sudo chmod 777 /home/$username $username

cp semester_content.sh /home/$username
touch /home/$username/.email
echo "$email" >> /home/$username/.email

echo -e "\nSet password for this student"
sudo passwd $username

echo -e "\nUser created $username"
