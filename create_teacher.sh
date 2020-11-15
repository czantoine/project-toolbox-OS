#!/bin/bash

server=$(cat file_system/.numserver)

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
sudo mkdir -m 710 /home/$username
sudo chown $username:$group /home/$username
sudo usermod -d /home/$username $username

sudo cp toolbox_teacher.sh /home/$username
sudo cp grade.sh /home/$username
sudo cp set_grade_file.sh /home/$username
sudo cp set_grade.sh /home/$username

touch .email
echo "$email" >> .email
sudo cp .email /home/$username
rm .email

sudo mkdir -m 770 /home/$username/ARCHIVE
cd /home/$username
sudo chgrp $group ARCHIVE

echo -e "\nSet password for this teacher"
echo -e "\n What is the new password"
read pas
echo "$username:$pas" | sudo chpasswd

echo "Welcome! Your account has been created.  Your username is $username and password is \"$pas\" without the quotes. The number of server is $server" | mail -s "New Account for $username" $email -b root $username

echo -e "\nUser created $username"
