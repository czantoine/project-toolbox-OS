#!/bin/bash

echo "###############"
echo "#             #"
echo "#   TOOLBOX   #"
echo "#    ADMIN    #"
echo "#             #"
echo "###############"
echo ""

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
echo "11. Save semester"
echo "12. Install ssh,ssmtp,gnuplot"
echo "0. Exit"

echo "Enter your choice"
read choice

if [[ $choice -eq 1 ]]
then

echo ""
bash create_student.sh

elif [[ $choice -eq 2 ]]
then

echo ""
bash create_teacher.sh

elif [[ $choice -eq 3 ]]
then

echo ""
bash create_student_auto.sh

elif [[ $choice -eq 4 ]]
then

echo ""
bash create_teacher_auto.sh

elif [[ $choice -eq 5 ]]
then

echo ""
bash semester_content_auto.sh

elif [[ $choice -eq 6 ]]
then

echo ""
bash create_dir.sh

elif [[ $choice -eq 7 ]]
then

echo ""
bash create_dir_auto.sh

elif [[ $choice -eq 8 ]]
then

echo ""
bash admin_rwx.sh

elif [[ $choice -eq 9 ]]
then

echo ""
bash scheduling.sh

elif [[ $choice -eq 10 ]]
then

echo ""
bash scheduling_grade.sh


elif [[ $choice -eq 11 ]]
then

echo ""
bash save_semester.sh

elif [[ $choice -eq 12 ]]
then

echo ""
bash install.sh

else
	exit 1
fi
done
