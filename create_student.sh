#!/bin/bash
#create student user

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
sudo usermod -d /home/antoine/Operating_system/Projet/toolbox/student/ $username
sudo chmod 755 /home/antoine/Operating_system/Projet/toolbox/student/ $username

echo -e "\nSet password for this student"
sudo passwd $username

echo -e "\nUser created $username"
