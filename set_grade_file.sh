#!/bin/bash

user=$USER

echo -e "\nAre you sure to add student grade for each course ? TAP YES or NO"
read rep

if [[ $rep = yes ]] || [[ $rep = YES ]] || [[ $rep == y ]]
then
	rr=$(find /home/$user/ -name "TD")
	uu=$(echo $rr | tr " " "\n")
	cmpt_uu=$(echo $uu | wc -w)
	D=($uu)

	for k in "${!D[@]}"; do
		printf 'D[%s] = %s\n' "$k" "${D[k]}" > /dev/null
	done

	for((k = 0 ; k < cmpt_uu ; k++));do
		cd ${D[k]}
		touch grade_student.txt
	done

	rrr=$(find /home/$user/ -name "TP")
        uuu=$(echo $rrr | tr " " "\n")
        cmpt_uuu=$(echo $uuu | wc -w)
        E=($uuu)

        for l in "${!E[@]}"; do
                printf 'E[%s] = %s\n' "$k" "${E[l]}" > /dev/null
        done

        for((l = 0 ; l < cmpt_uuu ; l++));do
                cd ${E[l]}
                touch grade_student.txt
        done

	aa=$(find /home/$user/ -name "CM")
        zz=$(echo $aa | tr " " "\n")
        cmpt_zz=$(echo $zz | wc -w)
        F=($zz)

        for m in "${!F[@]}"; do
                printf 'F[%s] = %s\n' "$m" "${F[m]}" > /dev/null
        done

        for((m = 0 ; m < cmpt_zz ; m++));do
                cd ${F[m]}
                touch grade_student.txt
        done

	xx=$(find /home/$user/ -name "DE")
        yy=$(echo $xx | tr " " "\n")
        cmpt_yy=$(echo $yy | wc -w)
        G=($yy)

        for n in "${!G[@]}"; do
                printf 'G[%s] = %s\n' "$n" "${G[n]}" > /dev/null
        done

        for((n = 0 ; n < cmpt_yy ; n++));do
                cd ${G[n]}
                touch grade_student.txt
        done

	ww=$(find /home/$user/ -name "CE")
        qq=$(echo $ww | tr " " "\n")
        cmpt_qq=$(echo $qq | wc -w)
        H=($qq)

        for j in "${!H[@]}"; do
                printf 'H[%s] = %s\n' "$j" "${H[j]}" > /dev/null
        done

        for((j = 0 ; j < cmpt_qq ; j++));do
                cd ${H[j]}
                touch grade_student.txt
        done



else
	echo "bye"
fi
