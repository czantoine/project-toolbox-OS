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
        echo -e "Error\n"
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
echo -n "EMAIL:$email ;" >> semester_sheet.txt

#cmpt=$(grep -o -P '(?<=MO:).*(?=;COEF:)' semester_sheet.txt | wc -w)
list=$(grep -o -P '(?<=MO:).*(?=;COEF:)' semester_sheet.txt)

V=($list)

for i in "${!V[@]}"; do
    printf 'V[%s] = %s\n' "$i" "${V[i]}"
done

echo -n "TP:" >> semester_sheet.txt

for ((i = 0 ; i < $x ; i++)); do
read -p "Do you want add TP for the ${V[i]} ? TAP Y or N : " -n 1 -r
echo -e "\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
        if [[ $x -eq $[$i+1] ]]
        then
		mkdir $ue/${V[i]}/TP
                echo -n "Y ;" >> semester_sheet.txt
        else
		mkdir $ue/${V[i]}/TP
                echo -n "Y " >> semester_sheet.txt
        fi
else
        if [[ $x -eq $[$i+1] ]]
        then
                echo -n "N ;" >> semester_sheet.txt
        else
                echo -n "N " >> semester_sheet.txt
        fi
fi
done


echo -n "ETP:;" >> semester_sheet.txt


echo -n "COEFTP:" >> semester_sheet.txt
cmptyn=$(grep -o -P '(?<=TP:).*(?=;ETP:)' semester_sheet.txt | wc -w)
listyn=$(grep -o -P '(?<=TP:).*(?=;ETP:)' semester_sheet.txt)

K=($listyn)

for i in "${!K[@]}"; do
    printf 'K[%s] = %s\n' "$i" "${K[i]}"
done

for ((i = 0 ; i < $cmptyn ; i++)); do

if [[ "${K[i]}" = "Y" ]]
then
	if [[ $cmptyn -eq $[$i+1] ]]
	then
		echo -e "\nEnter coef of ${V[i]}"
		read coeftp
		echo -n "$coeftp ;" >> semester_sheet.txt
	else
		echo -e "\nEnter coef of ${V[i]}"
                read coeftp
                echo -n "$coeftp " >> semester_sheet.txt
	fi
else
	echo -n "X" >> semester_sheet.txt
fi
done

VTD=($list)

for i in "${!VTD[@]}"; do
    printf 'VTD[%s] = %s\n' "$i" "${VTD[i]}"
done

echo -n "TD:" >> semester_sheet.txt

for ((i = 0 ; i < $x ; i++)); do
read -p "Do you want add TP for the ${VTP[i]} ? TAP Y or N : " -n 1 -r
echo -e "\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
        if [[ $x -eq $[$i+1] ]]
        then
                mkdir $ue/${VTD[i]}/TD
                echo -n "Y ;" >> semester_sheet.txt
        else
                mkdir $ue/${VTD[i]}/TD
                echo -n "Y " >> semester_sheet.txt
        fi
else
        if [[ $x -eq $[$i+1] ]]
        then
                echo -n "N ;" >> semester_sheet.txt
        else
                echo -n "N " >> semester_sheet.txt
        fi
fi
done


echo -n "ETD:;" >> semester_sheet.txt


echo -n "COEFTD:" >> semester_sheet.txt
cmptyntd=$(grep -o -P '(?<=TD:).*(?=;ETD:)' semester_sheet.txt | wc -w)
listyntd=$(grep -o -P '(?<=TD:).*(?=;ETD:)' semester_sheet.txt)

Ktd=($listyntd)

for i in "${!K[@]}"; do
    printf 'K[%s] = %s\n' "$i" "${K[i]}"
done

for ((i = 0 ; i < $cmptyntd ; i++)); do

if [[ "${Ktd[i]}" = "Y" ]]
then
        if [[ $cmptyntd -eq $[$i+1] ]]
        then
                echo -e "\nEnter coef of ${V[i]}"
                read coeftd
                echo -n "$coeftd ;" >> semester_sheet.txt
        else
                echo -e "\nEnter coef of ${V[i]}"
                read coeftd
                echo -n "$coeftd " >> semester_sheet.txt
        fi
else
        echo -n "X" >> semester_sheet.txt
fi
done
