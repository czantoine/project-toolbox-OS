#!/bin/bash

echo "###############"
echo "#             #"
echo "#   TOOLBOX   #"
echo "#    ADMIN    #"
echo "#             #"
echo "###############"


ext=0

while [ "$ext" = 0 ]; do

echo "1. Create new Student"
echo "2. Create new Teacher"
echo "3. "
echo "4. "
echo "5. "
echo "0. Exit"

echo "Enter your choice"
read choice

if [[ $choice -eq 1 ]]
then

bash create_student.sh

elif [[ $choice -eq 2 ]]
then

bash create_teacher.sh

elif [[ $choice -eq 3 ]]
then

elif [[ $choice -eq 4 ]]
then

else
	exit 1
fi
done
