#!/bin/bash

user=$USER

all_name=$(grep 'student' /etc/group | sort)
clear_group=$(echo $all_name | sed 's/.*://')

list=$(echo $clear_group | tr "," "\n")
cmpt_list=$(echo $list | wc -w)

V=($list)

for i in "${!V[@]}"; do
    printf 'V[%s] = %s\n' "$i" "${V[i]}"
done

for ((i = 0 ; i < $cmpt_list ; i++)); do
	cd /home/${V[i]}
	email_student_grade=$( cat .email )

	directory=$(sudo find /home/${V[i]} -name "grade.info")
	uu=$(echo $directory | tr " " "\n")
	cmpt_uu=$(echo $uu | wc -w)
	D=($uu)
	for k in "${!D[@]}"; do
		printf 'D[%s] = %s\n' "$k" "${D[k]}" > /dev/null
	done

	cd
	cd /home/${V[i]}/
	for((l = 0 ; l < cmpt_uu ; l++));do
		for c in "${!D[@]}"; do
                	        printf 'D[%s] = %s\n' "$c" "${D[c]}" > /dev/null
                        	diff --brief <(sort .grade_back.conf) <(sort grade.conf) > /dev/null
                        	comp_value=$?
                        	if [ $comp_value -eq 1 ]
                        	then
					sudo cp /home/${V[i]}/grade.conf /home/${V[i]}/.grade_back.conf
                                	mail -s "New grade" $email_student_grade <<< 'Hello ! New grade add in your course'
                        	else
                                	echo ""
                        	fi
                	done

	done

done
