#!/bin/bash

all_name=$(grep 'student' /etc/group | sort)
clear_group=$(echo $all_name | sed 's/.*://')

list=$(echo $clear_group | tr "," "\n")
cmpt_list=$(echo $list | wc -w)

V=($list)

for i in "${!V[@]}"; do
    printf 'V[%s] = %s\n' "$i" "${V[i]}"
done

for ((i = 0 ; i < $cmpt_list ; i++)); do

	directory=$(sudo find /home/${V[i]} -name "question_remark.txt")
	uu=$(echo $directory | tr " " "\n")
	cmpt_uu=$(echo $uu | wc -w)
	D=($uu)

	for k in "${!D[@]}"; do
    		printf 'D[%s] = %s\n' "$k" "${D[k]}"
	done

	cd
	cd /home/${V[i]}/
	number_line_file=$(wc -l < semester_sheet.txt)
	for((l = 1 ; l <= number_line_file ; l++));do
		ligne=$(sed -n "${l},1p" semester_sheet.txt)
		name_teacher=$(echo $ligne | sed 's/.*;TEACH://; s/;EMAIL:.*//')
		email=$(echo $ligne | sed 's/.*;EMAIL://; s/;TP:.*//')
		T=($name_teacher)
		for c in "${!T[@]}"; do
    			printf 'T[%s] = %s\n' "$c" "${T[c]}"
			diff --brief <(sudo sort ${D[c]}) <(sudo sort /home/${T[c]}/question_remark.txt) >/dev/null
			comp_value=$?
			if [ $comp_value -eq 1 ]
			then
    				echo "do something because they're different"
				sudo cp ${D[c]} /home/${T[c]}/question_remark.txt
				echo "copie"
				mail -s "Update Question & Remark" $email <<< 'Hello ! New file have been detected check your repo'
			else
  				echo "do something because they're identical"
			fi
		done
	done
done
