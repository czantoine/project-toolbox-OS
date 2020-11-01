#!/bin/bash

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

cd $go_s/$go_ue/$go_mo/$go_c

echo -e "\n You want add or edit grade ? "
read rep

if [[ $rep = Add ]] || [[ $rep = add ]] || [[ $rep == a ]]
then
	echo -e "\n What is the new grade /20 ?"
	read grade
	echo "$name_file: $grade/20" >> grade.info

elif [[ $rep = Edit ]] || [[ $rep = edit ]] || [[ $rep == e ]]
then
	echo -e "\n This is your file with grade :"
	cat grade.info

	echo -e "\n What is the new grade ?"
	read new_grade

	line_number=$(grep -n ''$name_file'' grade.info | sed 's/^\([0-9]\+\):.*$/\1/')
	pos_number=$( cat grade.info | sed -n "${line_number}p" | grep -aob '%')
	#delete all after file
	rep=$(sed "${line_number}s/^\([A-Za-z0-9]*\).*/\1/" grade.info)
	cat /dev/null > grade.info
        echo "$rep" >> grade.info

	rep2=$(sed "${line_number}s/^\( *[^ ]\+\)/\1 $new_grade\/20/" grade.info)
	cat /dev/null > grade.info
	echo "$rep2" >> grade.info
else
	echo "error"
fi
