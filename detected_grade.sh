#!/bin/bash

user=$USER

echo -e "\nWhat is username of student?"
read student

cd /home/$student

email_student_grade=$( cat .email )

directory=$(sudo find /home/$student -name "grade.info")
uu=$(echo $directory | tr " " "\n")
cmpt_uu=$(echo $uu | wc -w)
D=($uu)
for k in "${!D[@]}"; do
	printf 'D[%s] = %s\n' "$k" "${D[k]}" > /dev/null
done

cd
cd /home/$student/
for((l = 0 ; l < cmpt_uu ; l++));do
	for c in "${!D[@]}"; do
                        printf 'D[%s] = %s\n' "$c" "${D[c]}" > /dev/null
                        diff --brief <(sort .grade_back.conf) <(sort grade.conf) > /dev/null
                        comp_value=$?
                        if [ $comp_value -eq 1 ]
                        then
				sudo cp /home/$student/grade.conf /home/$student/.grade_back.conf
                                mail -s "New grade" $email_student_grade <<< 'Hello ! New grade add in your course'
                        else
                                echo ""
                        fi
                done

done

