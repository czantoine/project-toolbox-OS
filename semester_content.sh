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

#########################
##### Coef Module U #####
#########################


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


#########################
##### Name  Teacher #####
#########################


echo -e "\nName of Teacher"
read teach
echo -n "TEACH:$teach ;" >> semester_sheet.txt

#########################
##### Email Teacher #####
#########################


echo -e "\nEmail of Teacher"
read email
echo -n "EMAIL:$email ;" >> semester_sheet.txt


#########################
########## TP ###########
#########################

#cmpt=$(grep -o -P '(?<=MO:).*(?=;COEF:)' semester_sheet.txt | wc -w)

fline=$(grep -o -P '(?<=UE:'$UE').*(?=FINISH)' semester_sheet.txt)
list=$( echo "$fline" | grep -o -P '(?<=MO:).*(?=;COEF:)')

V=($list)

for i in "${!V[@]}"; do
    printf 'V[%s] = %s\n' "$i" "${V[i]}" > /dev/null
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
cmptyn=$(echo "$fline" | grep -o -P '(?<=TP:).*(?=;ETP:)' | wc -w)
listyn=$(echo "$fline" | grep -o -P '(?<=TP:).*(?=;ETP:)')

K=($listyn)

for i in "${!K[@]}"; do
    printf 'K[%s] = %s\n' "$i" "${K[i]}" > /dev/null
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
	if [[ $cmptyn -eq $[$i+1] ]]
	then
		echo -n "X ;" >> semester_sheet.txt
	else
		echo -n "X " >> semester_sheet.txt
	fi
fi
done


#########################
########## TD ###########
#########################



VTD=($list)

for i in "${!VTD[@]}"; do
    printf 'VTD[%s] = %s\n' "$i" "${VTD[i]}" > /dev/null
done

echo -n "TD:" >> semester_sheet.txt

for ((i = 0 ; i < $x ; i++)); do
read -p "Do you want add TP for the ${VTD[i]} ? TAP Y or N : " -n 1 -r
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
cmptyntd=$(echo "$fline" | grep -o -P '(?<=TD:).*(?=;ETD:)' | wc -w)
listyntd=$(echo "$fline" | grep -o -P '(?<=TD:).*(?=;ETD:)')

Ktd=($listyntd)

for i in "${!Ktd[@]}"; do
    printf 'Ktd[%s] = %s\n' "$i" "${Ktd[i]}" > /dev/null
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
        if [[ $cmptyn -eq $[$i+1] ]]
        then
                echo -n "X ;" >> semester_sheet.txt
        else
                echo -n "X " >> semester_sheet.txt
        fi
fi
done


#########################
########## CM ###########
#########################


VCM=($list)

for i in "${!VCM[@]}"; do
    printf 'VCM[%s] = %s\n' "$i" "${VCM[i]}" > /dev/null
done

echo -n "CM:" >> semester_sheet.txt

for ((i = 0 ; i < $x ; i++)); do
read -p "Do you want add CM for the ${VCM[i]} ? TAP Y or N : " -n 1 -r
echo -e "\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
        if [[ $x -eq $[$i+1] ]]
        then
                mkdir $ue/${VCM[i]}/CM
                echo -n "Y ;" >> semester_sheet.txt
        else
                mkdir $ue/${VCM[i]}/CM
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


echo -n "ECM:;" >> semester_sheet.txt


echo -n "COEFCM:" >> semester_sheet.txt
cmptyncm=$(echo "$fline" | grep -o -P '(?<=CM:).*(?=;ECM:)' | wc -w)
listyncm=$(echo "$fline" | grep -o -P '(?<=CM:).*(?=;ECM:)')

Kcm=($listyncm)

for i in "${!Kcm[@]}"; do
    printf 'Kcm[%s] = %s\n' "$i" "${Kcm[i]}" > /dev/null
done

for ((i = 0 ; i < $cmptyncm ; i++)); do

if [[ "${Kcm[i]}" = "Y" ]]
then
        if [[ $cmptyncm -eq $[$i+1] ]]
        then
                echo -e "\nEnter coef of ${V[i]}"
                read coefcm
                echo -n "$coefcm ;" >> semester_sheet.txt
        else
                echo -e "\nEnter coef of ${V[i]}"
                read coefcm
                echo -n "$coefcm " >> semester_sheet.txt
        fi
else
	if [[ $cmptyn -eq $[$i+1] ]]
        then
       	        echo -n "X ;" >> semester_sheet.txt
 	else
                echo -n "X " >> semester_sheet.txt
        fi
fi
done

#########################
########## DE ###########
#########################

VDE=($list)

for i in "${!VDE[@]}"; do
    printf 'VDE[%s] = %s\n' "$i" "${VDE[i]}" > /dev/null
done

echo -n "DE:" >> semester_sheet.txt

for ((i = 0 ; i < $x ; i++)); do
read -p "Do you want add DE for the ${VDE[i]} ? TAP Y or N : " -n 1 -r
echo -e "\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
        if [[ $x -eq $[$i+1] ]]
        then
                mkdir $ue/${VDE[i]}/DE
                echo -n "Y ;" >> semester_sheet.txt
        else
                mkdir $ue/${VDE[i]}/DE
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


echo -n "EDE:;" >> semester_sheet.txt


echo -n "COEFDE:" >> semester_sheet.txt
cmptynde=$(echo "$fline" | grep -o -P '(?<=DE:).*(?=;EDE:)' | wc -w)
listynde=$(echo "$fline" | grep -o -P '(?<=DE:).*(?=;EDE:)')

Kde=($listynde)

for i in "${!Kde[@]}"; do
    printf 'Kde[%s] = %s\n' "$i" "${Kde[i]}" > /dev/null
done

for ((i = 0 ; i < $cmptynde ; i++)); do

if [[ "${Kde[i]}" = "Y" ]]
then
        if [[ $cmptynde -eq $[$i+1] ]]
        then
                echo -e "\nEnter coef of ${V[i]}"
                read coefde
                echo -n "$coefde ;" >> semester_sheet.txt
        else
                echo -e "\nEnter coef of ${V[i]}"
                read coefde
                echo -n "$coefde " >> semester_sheet.txt
        fi
else
	if [[ $cmptyn -eq $[$i+1] ]]
        then
                echo -n "X ;" >> semester_sheet.txt
        else
                echo -n "X " >> semester_sheet.txt
        fi
fi
done


#########################
########## CE ###########
#########################


VCE=($list)

for i in "${!VCE[@]}"; do
    printf 'VCE[%s] = %s\n' "$i" "${VCE[i]}" > /dev/null
done

echo -n "CE:" >> semester_sheet.txt

for ((i = 0 ; i < $x ; i++)); do
read -p "Do you want add CE for the ${VCE[i]} ? TAP Y or N : " -n 1 -r
echo -e "\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
        if [[ $x -eq $[$i+1] ]]
        then
                mkdir $ue/${VCE[i]}/CE
                echo -n "Y ;" >> semester_sheet.txt
        else
                mkdir $ue/${VCE[i]}/CE
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


echo -n "ECE:;" >> semester_sheet.txt


echo -n "COEFCE:" >> semester_sheet.txt
cmptynce=$(echo "$fline" | grep -o -P '(?<=TP:).*(?=;ECE:)' | wc -w)
listynce=$(echo "$fline" | grep -o -P '(?<=CE:).*(?=;ECE:)')

Kce=($listynce)

for i in "${!Kce[@]}"; do
    printf 'Kce[%s] = %s\n' "$i" "${Kce[i]}" > /dev/null
done

for ((i = 0 ; i < $cmptynce ; i++)); do

if [[ "${Kce[i]}" = "Y" ]]
then
        if [[ $cmptynce -eq $[$i+1] ]]
        then
                echo -e "\nEnter coef of ${V[i]}"
                read coefce
                echo "$coefce ;FINISH" >> semester_sheet.txt
        else
                echo -e "\nEnter coef of ${V[i]}"
                read coefce
                echo -n "$coefce " >> semester_sheet.txt
        fi
else
        if [[ $cmptyn -eq $[$i+1] ]]
        then
                echo -n "X ;FINISH" >> semester_sheet.txt
        else
                echo -n "X " >> semester_sheet.txt
        fi
fi
done

