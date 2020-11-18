#!/bin/bash

user=$USER

echo -e "\n What is the student you want go?"
read student

echo -e "\n Add or edit grade:"
echo -e "\n What is semester you want go ?"
read go_s
echo -e "\n What is UE you want go ?"
read go_ue
echo -e "\n What is MO you want go ?"
read go_mo
echo -e "\n What is course you want go ?"
read go_c
echo -e "\n What is name of this file ?"
read name_file


echo -e "\n You want add or edit grade ? "
read rep

if [[ $rep = Add ]] || [[ $rep = add ]] || [[ $rep == a ]]
then
	echo -e "\n What is the new grade /20 ?"
	read grade
	echo "$name_file: $grade/20" >> /home/$student/$go_s/$go_ue/$go_mo/$go_c/grade.info

	NOW=$(date +"%d-%m-%Y-%r")
	echo "################################" >> /home/$student/grade.conf
	echo "New grade :" >> /home/$student/grade.conf
	echo "Write at : $NOW" >> /home/$student/grade.conf
	echo "Directory : $go_s/$go_ue/$go_mo/$go_c" >> /home/$student/grade.conf
	echo "Grade added by $user : $name_file: $grade/20" >> /home/$student/grade.conf

elif [[ $rep = Edit ]] || [[ $rep = edit ]] || [[ $rep == e ]]
then
	echo -e "\n This is your file with grade :"
	cat /home/$student/$go_s/$go_ue/$go_mo/$go_c/grade.info

	echo -e "\n What is the new grade ?"
	read new_grade

	line_number=$(grep -n ''$name_file'' /home/$student/$go_s/$go_ue/$go_mo/$go_c/grade.info | sed 's/^\([0-9]\+\):.*$/\1/')
	pos_number=$( cat grade.info | sed -n "${line_number}p" | grep -aob '%')

	rep=$(sed "${line_number}s/^\([A-Za-z0-9]*\).*/\1/" /home/$student/$go_s/$go_ue/$go_mo/$go_c/grade.info)
	cat /dev/null > /home/$student/$go_s/$go_ue/$go_mo/$go_c/grade.info
        echo "$rep" >> /home/$student/$go_s/$go_ue/$go_mo/$go_c/grade.info

	rep2=$(sed "${line_number}s/^\( *[^ ]\+\)/\1 $new_grade\/20/" /home/$student/$go_s/$go_ue/$go_mo/$go_c/grade.info)
	cat /dev/null > /home/$student/$go_s/$go_ue/$go_mo/$go_c/grade.info
	echo "$rep2" >> /home/$student/$go_s/$go_ue/$go_mo/$go_c/grade.info

	NOW=$(date +"%d-%m-%Y-%r")
        echo "################################" >> /home/$student/grade.conf
        echo "Grade editing :" >> /home/$student/grade.conf
        echo "Write at : $NOW" >> /home/$student/grade.conf
        echo "Directory : $go_s/$go_ue/$go_mo/$go_c" >> /home/$student/grade.conf
        echo "Grade added by $user : $name_file: $new_grade/20" >> /home/$student/grade.conf

else
	echo "error"
fi
