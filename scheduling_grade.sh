#!/bin/bash

echo -e "\nWhat is time in day"
read day

echo -e "\nWhat is time in hour"
read hour

echo -e "\nWhat is time in minute "
read minute

echo -e "\nWhat is time in second "
read second

echo -e "\nWhat is your email address ?"
read email_student_grade

numchoice=0

while [ "$numchoice" = 0 ]; do
	sleep "$day"d "$hour"h "$minute"m "$second"s
	bash detected_grade.sh
done
