#!/bin/bash

#ask information for the semester

echo -e "\nEnter Education Unit"
read ue
echo -n "UE:$ue;" >> semester_sheet.txt


echo -e "\nEnter Coefficiant of this Education Unit"
read coefue
echo -n "COEFUE:$coefue;" >> semester_sheet.txt


echo -e "\nHow many modules do you want to add?"
read x

if [[ $x == 0 ]]
then
        echo "Error"
        exit 1
fi

echo -n "MO:" >> semester_sheet.txt

for ((i = 1 ; i <= $x ; i++)); do
        if [[ $x -eq i ]]
        then
                echo -e "\nEnter Module name"
                read  mo
                echo -n "$mo;" >> semester_sheet.txt
        else
                echo -e "\nEnter Module name"
                read  mo
                echo -n "$mo," >> semester_sheet.txt
        fi
done
