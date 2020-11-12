#!/bin/bash

echo "###############"
echo "#             #"
echo "#   TOOLBOX   #"
echo "#   TEACHER   #"
echo "#             #"
echo "###############"

ext=0

while [ "$ext" = 0 ]; do

echo "1. Evaluation grade"
echo "2. Add student grade file into course"
echo "0. Exit"

echo "Enter your choice"
read choice

if [[ $choice -eq 1 ]]
then

bash grade.sh

elif [[ $choice -eq 2 ]]
then

bash set_grade_file.sh

echo ""

else
	exit 1
fi
done
