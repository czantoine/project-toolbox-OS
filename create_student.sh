#!/bin/bash

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
#sudo chown $username:$username /home/$username
#sudo usermod -d /home/$username $username

sudo cp toolbox_student.sh /home/$username
sudo cp semester_content.sh /home/$username
sudo cp manage_content.sh /home/$username
sudo cp manage_rwx.sh /home/$username
sudo cp add_work.sh /home/$username
sudo cp manage_pourcentage.sh /home/$username
sudo cp gnuplot.sh /home/$username
sudo cp question.remark.sh /home/$username
sudo cp send.sh /home/$username
sudo cp submit_work.sh /home/$username

touch .email
echo "$email" >> .email
sudo cp .email /home/$username
rm .email


echo -e "\nSet password for this student"
sudo passwd $username

echo -e "\nUser created $username"
