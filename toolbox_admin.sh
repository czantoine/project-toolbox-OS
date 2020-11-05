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
echo "3. Manage rwx on group or owner"
echo "4. Scheduling question remark"
echo "5. Scheduling grade"
echo "6. Install ssh,ssmtp,gnuplot"
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

bash admin_rwx.sh

elif [[ $choice -eq 4 ]]
then

bash scheduling.sh

elif [[ $choice -eq 5 ]]
then

bash scheduling_grade.sh

elif [[ $choice -eq 6 ]]
then

bash install.sh

else
	exit 1
fi
done
