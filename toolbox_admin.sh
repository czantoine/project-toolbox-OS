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
echo "3. Create new Student with automatic list"
echo "4. Create new Teacher with automatic list"
echo "5. Create new semester automatic list"
echo "6. Add directory Teacher"
echo "7. Add directory Teacher with automatic list"
echo "8. Manage rwx on group or owner"
echo "9. Scheduling question remark"
echo "10. Scheduling grade"
echo "11. Install ssh,ssmtp,gnuplot"
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

bash create_student_auto.sh

elif [[ $choice -eq 4 ]]
then

bash create_teacher_auto.sh

elif [[ $choice -eq 5 ]]
then

bash semester_content_auto.sh

elif [[ $choice -eq 6 ]]
then

bash create_dir.sh

elif [[ $choice -eq 7 ]]
then

bash create_dir_auto.sh

elif [[ $choice -eq 8 ]]
then

bash admin_rwx.sh

elif [[ $choice -eq 9 ]]
then

bash scheduling.sh

elif [[ $choice -eq 10 ]]
then

bash scheduling_grade.sh

elif [[ $choice -eq 11 ]]
then

bash install.sh

else
	exit 1
fi
done
