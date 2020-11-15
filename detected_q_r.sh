#!/bin/bash

all_name=$(grep 'student' /etc/group | sort)
clear_group=$(echo $all_name | sed 's/.*://')

list=$(echo $clear_group | tr "," "\n")
cmpt_list=$(echo $list | wc -w)

V=($list)

for i in "${!V[@]}"; do
    printf 'V[%s] = %s\n' "$i" "${V[i]}" #> /dev/null
done

for ((i = 0 ; i < $cmpt_list ; i++)); do

	directory=$(sudo find /home/${V[i]} -name "question_remark.txt")
	uu=$(echo $directory | tr " " "\n")
	cmpt_uu=$(echo $uu | wc -w)
	D=($uu)

	for k in "${!D[@]}"; do
    		printf 'D[%s] = %s\n' "$k" "${D[k]}" > /dev/null
	done

	cd
	cd /home/${V[i]}/

	sss=$(sudo find /home/${V[i]} -name "semester_S*")
        gg=$(echo $sss | tr " " "\n")
        cmpt_gg=$(echo $gg | wc -w)
        S=($gg)

        for p in "${!S[@]}"; do
                printf 'S[%s] = %s\n' "$p" "${S[p]}" > /dev/null
        done

	number_line_file=$(wc -l < "${S[p]}")
	for((l = 1 ; l <= number_line_file ; l++));do
		ligne=$(sed -n "${l},1p" "${S[p]}")
		name_teacher=$(echo $ligne | sed 's/.*;TEACH://; s/;EMAILTEACH:.*//')
		email=$(echo $ligne | sed 's/.*;EMAILTEACH://; s/;TP:.*//')
		T=($name_teacher)
		for c in "${!T[@]}"; do
    			printf 'T[%s] = %s\n' "$c" "${T[c]}"
			diff --brief <(sudo sort question_remark.conf) <(sudo sort /home/${T[c]}/question_remark.txt) > /dev/null
			comp_value=$?
			if [ $comp_value -eq 1 ]
			then
    				echo "do something because they're different"
				sudo cp question_remark.conf /home/${T[c]}/question_remark.txt
				echo "copie done"
				mail -s "Update Question & Remark" $email <<< 'Hello ! New file have been detected check your repo'
			else
  				echo "do something because they're identical"
			fi
		done
	done
done
