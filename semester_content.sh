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


echo -e "\nEnter Coef of Module Unit"
echo -n "COEF:" >> semester_sheet.txt

for ((i = 1 ; i <= $x ; i++)); do
        if [[ $x -eq i ]]
        then
                echo -e "\nCoef of $i module is:"
                read coef
                echo -n "$coef;" >> semester_sheet.txt
        else
                echo -e "\nCoef of $i module is :"
                read coef
                echo -n "$coef," >> semester_sheet.txt
        fi
done


echo -e "\nName of Teacher"
read teach
echo -n "TEACH:$teach;" >> semester_sheet.txt


echo -e "\nEmail of Teacher"
read email
echo -n "EMAIL$email;" >> semester_sheet.txt

for ((i = 1 ; i <= $x ; i++)); do
read -p "Do you want add TP for the $x you have add ?" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
        if [[ $x -eq i ]]
        then
                echo -n "Y;" >> semester_sheet.txt
        else
                echo -n "Y," >> semester_sheet.txt
        fi
else
        if [[ $x -eq i ]]
        then
                echo -n "N;" >> semester_sheet.txt
        else
                echo -n "N," >> semester_sheet.txt
        fi
fi
done
