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

cp toolbox_student.sh /home/$username
cp semester_content.sh /home/$username
cp manage_content.sh /home/$username
cp manage_rwx.sh /home/$username
cp add.work.sh /home/$username
cp manage_pourcentage.sh /home/$username
cp gnuplot.sh /home/$username
cp question.remark.sh /home/$username
cp send.sh /home/$username
cp submit_work.sh /home/$username

touch /home/$username/.email
echo "$email" >> /home/$username/.email

echo -e "\nSet password for this student"
sudo passwd $username

echo -e "\nUser created $username"
