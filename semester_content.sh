#!/bin/bash

#ask information for the semester

echo -e "\nEnter semester number"
read sn
mkdir -m 710 S$sn
#chgrp teacher S$sn

##### add user associate semester ####
username=$USER
NOW=$(date +"%d-%m-%Y-%r")
username_group=$(id -Gn $username)
echo "################################" >> semester.conf
echo "Write at : $NOW" >> semester.conf
echo "S$sn : $username_group" >> semester.conf


echo -e "\nEnter Education Unit"
read ue
echo -n "UE:$ue ;" >> semester_S$sn.info
mkdir -m 710 S$sn/$ue
#chgrp teacher S$sn/$ue

echo -e "\nEnter Coefficiant of this Education Unit"
read coefue
echo -n "COEFUE:$coefue ;" >> semester_S$sn.info


echo -e "\nHow many modules do you want to add?"
read x

if [[ $x == 0 ]]
then
        echo -e "Error\n"
        exit 1
fi

echo -n "MO:" >> semester_S$sn.info

for ((i = 1 ; i <= $x ; i++)); do
        if [[ $x -eq i ]]
        then
                echo -e "\nEnter Module name"
                read mo
		cd S$sn
		mkdir -m 710 $ue/$mo
		#chgrp teacher /$ue/$mo
		cd - > /dev/null
                echo -n "$mo ;" >> semester_S$sn.info
        else
                echo -e "\nEnter Module name"
                read mo
		cd S$sn
                mkdir -m 710 $ue/$mo
		#chgrp teacher /$ue/$mo
                cd - > /dev/null
                echo -n "$mo " >> semester_S$sn.info
        fi
done

#########################
##### Coef Module U #####
#########################


echo -e "\nEnter Coef of Module Unit"
echo -n "COEF:" >> semester_S$sn.info

for ((i = 1 ; i <= $x ; i++)); do
        if [[ $x -eq i ]]
        then
                echo -e "\nCoef of $i module is:"
                read coef
                echo -n "$coef ;" >> semester_S$sn.info
        else
                echo -e "\nCoef of $i module is :"
                read coef
                echo -n "$coef ," >> semester_S$sn.info
        fi
done


#########################
##### Name  Teacher #####
#########################


echo -e "\nName of Teacher"
read teach
echo -n "TEACH:$teach ;" >> semester_S$sn.info

#########################
##### Email Teacher #####
#########################


echo -e "\nEmail of Teacher"
read email
echo -n "EMAIL:$email ;" >> semester_S$sn.info


#########################
########## TP ###########
#########################

#cmpt=$(grep -o -P '(?<=MO:).*(?=;COEF:)' semester_sheet.txt | wc -w)

fline=$(grep -o -P '(?<=UE:'$UE').*(?=;COEF:)' semester_S$sn.info)
list=$(echo $fline | sed 's/.*MO://; s/;COEF.*//') #find module

V=($list)

for i in "${!V[@]}"; do
    printf 'V[%s] = %s\n' "$i" "${V[i]}" > /dev/null
done

echo -n "TP:" >> semester_S$sn.info

for ((i = 0 ; i < $x ; i++)); do
read -p "Do you want add TP for the ${V[i]} ? TAP Y or N : " -n 1 -r
echo -e "\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
        if [[ $x -eq $[$i+1] ]]
        then
		mkdir -m 770 S$sn/$ue/${V[i]}/TP
		#chgrp teacher S$sn/$ue/${V[i]}/TP
                echo -n "Y ;" >> semester_S$sn.info
        else
		mkdir -m 770 S$sn/$ue/${V[i]}/TP
		#chgrp teacher S$sn/$ue/${V[i]}/TP
                echo -n "Y " >> semester_S$sn.info
        fi
else
        if [[ $x -eq $[$i+1] ]]
        then
                echo -n "N ;" >> semester_S$sn.info
        else
                echo -n "N " >> semester_S$sn.info
        fi
fi
done


echo -n "ETP: ;" >> semester_S$sn.info


echo -n "COEFTP:" >> semester_S$sn.info
flinetp=$(grep -o -P '(?<=UE:'$UE').*(?=COEFTP)' semester_S$sn.info)
listyn=$(echo $flinetp | sed 's/.*;TP://; s/;ETP:.*//')
cmptyntp=$(echo $listyn | wc -w)

K=($listyn)

for i in "${!K[@]}"; do
    printf 'K[%s] = %s\n' "$i" "${K[i]}" > /dev/null
done

for ((i = 0 ; i < $cmptyntp ; i++)); do

if [[ "${K[i]}" = "Y" ]]
then
	if [[ $cmptyntp -eq $[$i+1] ]]
	then
		echo -e "\nEnter coef :"
		read coeftp
		echo -n "$coeftp ;" >> semester_S$sn.info
	else
		echo -e "\nEnter coef :"
                read coeftp
                echo -n "$coeftp " >> semester_S$sn.info
	fi
else
	if [[ $cmptyntp -eq $[$i+1] ]]
	then
		echo -n "X ;" >> semester_S$sn.info
	else
		echo -n "X " >> semester_S$sn.info
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

echo -n "TD:" >> semester_S$sn.info

for ((i = 0 ; i < $x ; i++)); do
read -p "Do you want add TD for the ${VTD[i]} ? TAP Y or N : " -n 1 -r
echo -e "\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
        if [[ $x -eq $[$i+1] ]]
        then
                mkdir -m 770 S$sn/$ue/${VTD[i]}/TD
		#chgrp teacher S$sn/$ue/${V[i]}/TD
                echo -n "Y ;" >> semester_S$sn.info
        else
                mkdir -m 770 S$sn/$ue/${VTD[i]}/TD
		#chgrp teacher S$sn/$ue/${V[i]}/TD
                echo -n "Y " >> semester_S$sn.info
        fi
else
        if [[ $x -eq $[$i+1] ]]
        then
                echo -n "N ;" >> semester_S$sn.info
        else
                echo -n "N " >> semester_S$sn.info
        fi
fi
done


echo -n "ETD:;" >> semester_S$sn.info


echo -n "COEFTD:" >> semester_S$sn.info
flinetd=$(grep -o -P '(?<=UE:'$UE').*(?=COEFTD)' semester_S$sn.info)
listyntd=$(echo $flinetd | sed 's/.*;TD://; s/;ETD:.*//')
cmptyntd=$(echo $listyntd | wc -w)


Ktd=($listyntd)

for i in "${!Ktd[@]}"; do
    printf 'Ktd[%s] = %s\n' "$i" "${Ktd[i]}" > /dev/null
done

for ((i = 0 ; i < $cmptyntd ; i++)); do

if [[ "${Ktd[i]}" = "Y" ]]
then
        if [[ $cmptyntd -eq $[$i+1] ]]
        then
                echo -e "\nEnter coef :"
                read coeftd
                echo -n "$coeftd;" >> semester_S$sn.info
        else
                echo -e "\nEnter coef :"
                read coeftd
                echo -n "$coeftd " >> semester_S$sn.info
        fi
else
        if [[ $cmptyntd -eq $[$i+1] ]]
        then
                echo -n "X ;" >> semester_S$sn.info
        else
                echo -n "X " >> semester_S$sn.info
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

echo -n "CM:" >> semester_S$sn.info

for ((i = 0 ; i < $x ; i++)); do
read -p "Do you want add CM for the ${VCM[i]} ? TAP Y or N : " -n 1 -r
echo -e "\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
        if [[ $x -eq $[$i+1] ]]
        then
                mkdir -m 770 S$sn/$ue/${VCM[i]}/CM
		#chgrp teacher S$sn/$ue/${V[i]}/CM
                echo -n "Y ;" >> semester_S$sn.info
        else
                mkdir -m 770 S$sn/$ue/${VCM[i]}/CM
                #chgrp teacher S$sn/$ue/${V[i]}/CM
		echo -n "Y " >> semester_S$sn.info
        fi
else
        if [[ $x -eq $[$i+1] ]]
        then
                echo -n "N ;" >> semester_S$sn.info
        else
                echo -n "N " >> semester_S$sn.info
        fi
fi
done


echo -n "ECM:;" >> semester_S$sn.info


echo -n "COEFCM:" >> semester_S$sn.info
flinecm=$(grep -o -P '(?<=UE:'$UE').*(?=COEFCM)' semester_S$sn.info)
listyncm=$(echo $flinecm | sed 's/.*;CM://; s/;ECM:.*//')
cmptyncm=$(echo $listyncm | wc -w)

Kcm=($listyncm)

for i in "${!Kcm[@]}"; do
    printf 'Kcm[%s] = %s\n' "$i" "${Kcm[i]}" > /dev/null
done

for ((i = 0 ; i < $cmptyncm ; i++)); do

if [[ "${Kcm[i]}" = "Y" ]]
then
        if [[ $cmptyncm -eq $[$i+1] ]]
        then
                echo -e "\nEnter coef :"
                read coefcm
                echo -n "$coefcm ;" >> semester_S$sn.info
        else
                echo -e "\nEnter coef :"
                read coefcm
                echo -n "$coefcm " >> semester_S$sn.info
        fi
else
	if [[ $cmptyncm -eq $[$i+1] ]]
        then
       	        echo -n "X ;" >> semester_S$sn.info
 	else
                echo -n "X " >> semester_S$sn.info
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

echo -n "DE:" >> semester_S$sn.info

for ((i = 0 ; i < $x ; i++)); do
read -p "Do you want add DE for the ${VDE[i]} ? TAP Y or N : " -n 1 -r
echo -e "\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
        if [[ $x -eq $[$i+1] ]]
        then
                mkdir -m 770 S$sn/$ue/${VDE[i]}/DE
		#chgrp teacher S$sn/$ue/${V[i]}/DE
                echo -n "Y ;" >> semester_S$sn.info
        else
                mkdir -m 770 S$sn/$ue/${VDE[i]}/DE
		#chgrp teacher S$sn/$ue/${V[i]}/DE
                echo -n "Y " >> semester_S$sn.info
        fi
else
        if [[ $x -eq $[$i+1] ]]
        then
                echo -n "N ;" >> semester_S$sn.info
        else
                echo -n "N " >> semester_S$sn.info
        fi
fi
done


echo -n "EDE:;" >> semester_S$sn.info


echo -n "COEFDE:" >> semester_S$sn.info
flinede=$(grep -o -P '(?<=UE:'$UE').*(?=COEFDE)' semester_S$sn.info)
listynde=$(echo $flinede | sed 's/.*;DE://; s/;EDE:.*//')
cmptynde=$(echo $listynde | wc -w)


Kde=($listynde)

for i in "${!Kde[@]}"; do
    printf 'Kde[%s] = %s\n' "$i" "${Kde[i]}" > /dev/null
done

for ((i = 0 ; i < $cmptynde ; i++)); do

if [[ "${Kde[i]}" = "Y" ]]
then
        if [[ $cmptynde -eq $[$i+1] ]]
        then
                echo -e "\nEnter coef :"
                read coefde
                echo -n "$coefde ;" >> semester_S$sn.info
        else
                echo -e "\nEnter coef :"
                read coefde
                echo -n "$coefde " >> semester_S$sn.info
        fi
else
	if [[ $cmptynde -eq $[$i+1] ]]
        then
                echo -n "X ;" >> semester_S$sn.info
        else
                echo -n "X " >> semester_S$sn.info
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

echo -n "CE:" >> semester_S$sn.info

for ((i = 0 ; i < $x ; i++)); do
read -p "Do you want add CE for the ${VCE[i]} ? TAP Y or N : " -n 1 -r
echo -e "\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
        if [[ $x -eq $[$i+1] ]]
        then
                mkdir -m 770 S$sn/$ue/${VCE[i]}/CE
		#chgrp teacher S$sn/$ue/${V[i]}/CE
                echo -n "Y ;" >> semester_S$sn.info
        else
                mkdir -m 770 S$sn/$ue/${VCE[i]}/CE
		#chgrp teacher S$sn/$ue/${V[i]}/CE
                echo -n "Y " >> semester_S$sn.info
        fi
else
        if [[ $x -eq $[$i+1] ]]
        then
                echo -n "N ;" >> semester_S$sn.info
        else
                echo -n "N " >> semester_S$sn.info
        fi
fi
done


echo -n "ECE:;" >> semester_S$sn.info


echo -n "COEFCE:" >> semester_S$sn.info
flinece=$(grep -o -P '(?<=UE:'$UE').*(?=COEFCE)' semester_S$sn.info)
listynce=$(echo $flinece | sed 's/.*;CE://; s/;ECE:.*//')
cmptynce=$(echo $listynce | wc -w)

Kce=($listynce)

for i in "${!Kce[@]}"; do
    printf 'Kce[%s] = %s\n' "$i" "${Kce[i]}" > /dev/null
done

for ((i = 0 ; i < $cmptynce ; i++)); do

if [[ "${Kce[i]}" = "Y" ]]
then
        if [[ $cmptynce -eq $[$i+1] ]]
        then
                echo -e "\nEnter coef :"
                read coefce
                echo "$coefce ;FINISH" >> semester_S$sn.info
        else
                echo -e "\nEnter coef :"
                read coefce
                echo -n "$coefce " >> semester_S$sn.info
        fi
else
        if [[ $cmptynce -eq $[$i+1] ]]
        then
                echo -n "X ;FINISH" >> semester_S$sn.info
        else
                echo -n "X " >> semester_S$sn.info
        fi
fi
done
