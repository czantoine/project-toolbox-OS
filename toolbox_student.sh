#!/bin/bash

if [ ! -f grade.conf ]; then
	touch grade.conf
	chmod 570 grade.conf
	chgrp teacher grade.conf
fi

if [ ! -f question_remark.conf ]; then
        touch question_remark.conf
        chmod 570 question_remark.conf
        chgrp teacher question_remark.conf
fi


echo "###############"
echo "#             #"
echo "#   TOOLBOX   #"
echo "#   STUDENT   #"
echo "#             #"
echo "###############"
echo ""

ext=0

while [ "$ext" = 0 ]; do

echo "1. Create new semester"
echo "2. Edit a semester"
echo "3. Add a group on my course or file"
echo "4. Create a new work"
echo "5. Manage my pourcentage file advencement"
echo "6. Show workflow and grade on histogram"
echo "7. Send questions & remark"
echo "8. Send file at other student"
echo "9. Submit work"
echo "0. Exit"

echo "Enter your choice"
read choice

if [[ $choice -eq 1 ]]
then

bash semester_content.sh

elif [[ $choice -eq 2 ]]
then

bash manage_content.sh

elif [[ $choice -eq 3 ]]
then

bash manage_rwx.sh

elif [[ $choice -eq 4 ]]
then

bash add.work.sh

elif [[ $choice -eq 5 ]]
then

bash manage_pourcentage.sh

elif [[ $choice -eq 6 ]]
then

bash gnuplot.sh

elif [[ $choice -eq 7 ]]
then

bash question.remark.sh

elif [[ $choice -eq 8 ]]
then

send.sh

elif [[ $choice -eq 9 ]]
then

submit_work.sh

else
	exit 1
fi
done
