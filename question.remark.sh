#!/bin/bash

echo -e "\n Add work file in course :"
echo -e "\n What is semester you want go ?"
read go_s
echo -e "\n What is UE you want go ?"
read go_ue
echo -e "\n What is MO you want go ?"
read go_mo
echo -e "\n What is course you want go ?"
read go_c

cd $go_s/$go_ue/$go_mo/$go_c

echo -e "\n What you have ? Question or Remark ? "
read rep_q_r

if [[ $rep_q_r = Question ]] || [[ $rep_q_r = Q ]] || [[ $rep_q_r == q ]]
then
        echo -e "\n What is your question ?"
	read question
	NOW=$(date +"%d-%m-%Y-%r")
	echo "################################" >> question_remark.txt
	echo "New question :" >> question_remark.txt
	echo "Write at : $NOW" >> question_remark.txt
	echo "$question" >> question_remark.txt
	echo -e "\n Your question have been writing !"

elif [[ $rep_q_r = Remark ]] || [[ $rep_q_r = R ]] || [[ $rep_q_r == r ]]
then
	echo -e "\n What is your remark ?"
        read remark
        NOW=$(date +"%d-%m-%Y-%r")
        echo "################################" >> question_remark.txt
        echo "New remark :" >> question_remark.txt
        echo "Whrite at : $NOW" >> question_remark.txt
        echo "$remark" >> question_remark.txt
	echo -e "\n Your remark have been writing !"
else
	echo -e "error"
	exit 1
fi


