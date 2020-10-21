#!/bin/bash

#ask information for the semester

echo -e "\nEnter Education Unit"
read ue
echo -n "UE:$ue;" >> semester_sheet.txt
mkdir -m 700 $ue

echo -e "\nEnter Coefficiant of this Education Unit"
read coefue
echo -n "COEFUE:$coefue ;" >> semester_sheet.txt


echo -e "\nHow many modules do you want to add?"
read x

if [[ $x == 0 ]]
then
        echo -e "Error"
        exit 1
fi

echo -n "MO:" >> semester_sheet.txt

for ((i = 1 ; i <= $x ; i++)); do
        if [[ $x -eq i ]]
        then
                echo -e "\nEnter Module name"
                read  mo
        cd $ue
        mkdir $mo
        cd - > /dev/null
                echo -n "$mo ;" >> semester_sheet.txt
        else
                echo -e "\nEnter Module name"
                read  mo
        cd $ue
                mkdir $mo
                cd - > /dev/null
                echo -n "$mo " >> semester_sheet.txt
        fi
done


echo -e "\nEnter Coef of Module Unit"
echo -n "COEF:" >> semester_sheet.txt

for ((i = 1 ; i <= $x ; i++)); do
        if [[ $x -eq i ]]
        then
                echo -e "\nCoef of $i module is:"
                read coef
                echo -n "$coef ;" >> semester_sheet.txt
        else
                echo -e "\nCoef of $i module is :"
                read coef
                echo -n "$coef ," >> semester_sheet.txt
        fi
done


echo -e "\nName of Teacher"
read teach
echo -n "TEACH:$teach ;" >> semester_sheet.txt


echo -e "\nEmail of Teacher"
read email
echo -n "EMAIL$email ;" >> semester_sheet.txt

#cmpt=$(grep -o -P '(?<=MO:).*(?=;COEF)' semester_sheet.txt | wc -w)
list=$(grep -o -P '(?<=MO:).*(?=;COEF)' semester_sheet.txt)

V=($list)

for i in "${!V[@]}"; do
    printf 'V[%s] = %s\n' "$i" "${V[i]}"
done

for ((i = 0 ; i < $x ; i++)); do
read -p "Do you want add TP for the $[i+1] you have add ? TAP Y or N" -n 1 -r
echo -e "\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
        if [[ $x -eq i ]]
        then
        mkdir $ue/${V[i]}/TP
                echo -n "Y ;" >> semester_sheet.txt
        else
        mkdir $ue/${V[i]}/TP
                echo -n "Y ," >> semester_sheet.txt
        fi
else
        if [[ $x -eq i ]]
        then
                echo -n "N ;" >> semester_sheet.txt
        else
                echo -n "N ," >> semester_sheet.txt
        fi
fi
done
