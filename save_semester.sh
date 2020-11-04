#!/bin/bash

echo -e "\nWhat is the semester you want archive ?"
read sem

echo -e "\nWhat is the user name you want send archive ?"
read user_s

echo -e "\nWhat is the ip address  you want send archive ?"
read ip_s

tar cf archive_$sem.tar $sem

scp archive_$sem.tar $user_s@$ip_s:/home/$user_s

echo -e "\n Send it !"


