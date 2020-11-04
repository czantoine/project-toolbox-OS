#!/bin/bash

user=$USER

echo -e "\n What is the student you want go?"
read student

echo -e "\nWhat is the semester you want archive ?"
read sem

cd /home/$student/

echo -e "\n What is name of user you want send archive ?"
read us

echo -e "\nWhat is the ip address  you want send archive ?"
read ip_s

sudo tar cf $sem.tar $sem

sudo cp $sem.tar /home/$user

cd /home/$user
pwd
sudo chmod 700 $sem.tar
pwd
sudo scp $sem.tar $us@$ip_s:/home/$us

echo -e "\n Send it !"


