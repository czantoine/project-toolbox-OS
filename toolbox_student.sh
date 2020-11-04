#!/bin/bash

echo "###############"
echo "#             #"
echo "#   TOOLBOX   #"
echo "#   STUDENT   #"
echo "#             #"
echo "###############"


ext=0

while [ "$ext" = 0 ]; do

echo "1. Create new semester"
echo "2. Edit a semester"
echo "3. Add a group on my course or file"
echo "4. Create a new work"
echo "5. Manage my pourcentage file advencement"
echo "6. Show workflow and grade on histogram"
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

else
	exit 1
fi
done
