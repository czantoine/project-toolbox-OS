#!/bin/bash

user=$USER

echo -e "\n Submit work result :"
echo -e "\n What is semester you want go ?"
read go_s
echo -e "\n What is UE you want go ?"
read go_ue
echo -e "\n What is MO you want go ?"
read go_mo
echo -e "\n What is course you want go ?"
read go_c
echo -e "\n What is name of this work?"
read name_file

echo -e "\n What is nane of your teacher ?"
read teacher_name

email_t=$( cat /home/$teacher_name/.email )

if [ -d "$go_s/$go_ue/$go_mo/$go_c/" ]
then
	cd $go_s/$go_ue/$go_mo/$go_c/
	tar cf $user_$name_file.tar $name_file
	cp $user_$name_file.tar /home/$teacher_name/ARCHIVE
	rm $user_$name_file.tar

	mail -s "New Archive" $email_t <<< 'Hello ! New archive add in your ARCHIVE directory'
	echo -e "\nFile have been archived  and received by $teacher_name"
	exit 1

else
    echo "Error: Directory $go_s/$go_ue/$go_mo/$go_c/ does not exists."
fi

