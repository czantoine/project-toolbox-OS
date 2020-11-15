#!/bin/bash

echo -e "\n What is you group class you want add a new grade ?"
read ggg

user=$USER

if grep -q $ggg /etc/group
    	then
		group_member=$(grep "$ggg" /etc/group)
		clear_group=$(echo $group_member | sed 's/.*://')
		listt=$(echo $clear_group | tr "," "\n")
        	cmpt_listt=$(echo $listt | wc -w)
		VV=($listt)
		for i in "${!VV[@]}"; do
   			printf 'VV[%s] = %s\n' "$i" "${VV[i]}" > /dev/null
		done
		for ((i = 0 ; i < $cmpt_listt ; i++)); do
			ss=$(groups ${VV[i]})
			if [[ $ss == *"student"* ]]; then
  			var3="$var3${VV[i]},"
			fi
		done

		clear_groupp=$(echo $var3 | tr "," "\n")
		cmpt_list=$(echo $clear_groupp | wc -w)
		V=($clear_groupp)
		for i in "${!V[@]}"; do
                        printf 'V[%s] = %s\n' "$i" "${V[i]}" > /dev/null
                done

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

		for ((i = 0 ; i < $cmpt_list ; i++)); do
			cd /home/$user/$go_s/$go_ue/$go_mo/$go_c
			echo -e "\nEnter the grade for : ${V[i]}"
			read  gr
			echo "$name_file:${V[i]}:$gr" >> grade_student.txt
			cd /home/${V[i]}/
			NOW=$(date +"%d-%m-%Y-%r")
			echo "################################" >> grade.conf
			echo "New grade :" >> grade.conf
			echo "Write at : $NOW" >> grade.conf
			echo "Directory : $go_s/$go_ue/$go_mo/$go_c" >> grade.conf
			echo "Grade added by $user : $name_file: $grade/20" >> grade.conf
			cd /home/${V[i]}/$go_s/$go_ue/$go_mo/$go_c
			echo "$name_file: $gr/20" >> grade.info
		done
else
	echo "error"
fi
