#!/bin/bash

read -p "Do you want see tree of your directory ? Insert Y or N : " -n 1 -r
echo -e "\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
	tree
else
	echo -e "\n"
fi

ext=0

while [ "$ext" = 0 ]; do

echo -e "\nWhat do you want to do ? Insert ADD or MODIFY or DELETE : "
read adel

if [[ $adel = add ]] || [[ $adel = ADD ]]
then
    echo -e "\nWhat do you want to add ?"
    echo "Enter your choice"
    echo "1. UE"
    echo "2. MO"
    echo "3. TP"
    echo "4. TD"
    echo "5. CM"
    echo "6. DE"
    echo "7. CE"
    echo "Exit"
    read rep
    if [[ $rep -eq 1 ]]
    then
    	echo "Rien"
        echo -e "\n" >> semester_content.sh
        bash semester_content.sh
    elif [[ $rep -eq 2 ]]
    then
	echo -e "\nWhich Semester do you want to add a Module?"
	listsem=$(ls -d *[0-9])
	echo -e "\nThis is what you have :\n$listsem"
	echo -e "\nInsert the number of the semester:"
	read semester
	semname="S$semester"
	semestername="semester_S$semester.info"
        echo -e "\nWhich UE do you want to add a Module ?"
	first_word=$(grep -Eo '^[^ ]+' $semestername)
	echo -e "\nThis is what you have :\n$first_word"
	echo -e "\nInsert the name UE who you want to add a Module ?"
	read uename
	line_number=$(grep -n ''$uename'' $semestername | sed 's/^\([0-9]\+\):.*$/\1/')
	echo -e "\nInsert the name of your Module ?"
	read modname
	pos_number=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;COEF:')
	pos_letter=$(echo "$pos_number" | sed  's/: ;COEF.*//')
	aa=$(sed -E "${line_number}s/(.{$pos_letter})/& ${name}/" $semestername)
	cat /dev/null > $semestername
	echo "$aa" >> $semestername

	mkdir $semname/$uename/$modname
	
	echo -e "\nInsert the coef of your Module? "
        read addcoef
	pos_number_coef=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;TEACH:')
        pos_letter_coef=$(echo "$pos_number_coef" | sed  's/: ;TEACH.*//')
	co=$(sed -E "${line_number}s/(.{$pos_letter_coef})/&, ${addcoef}/" $semestername)
	cat /dev/null > $semestername
        echo "$co" >> $semestername
	
	pos_number_tp=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;ETP:')
	pos_letter_tp=$(echo "$pos_number_tp" | sed  's/: ;ETP.*//')
	echo "Do you want to add TP ? TAP Y or N"
	read rep
	if [[ $rep =~ ^[Yy]$ ]]
	then
	    Yes=Y
	    etp=$(sed -E "${line_number}s/(.{$pos_letter_tp})/& ${Yes}/" $semestername)
	    cat /dev/null > $semestername
	    echo "$etp" >> $semestername
	    
	    echo -e "\nEnter coef : "
	    read rep_coef
	    pos_number_coefetp=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;TD:')
	    pos_letter_coef_tp=$(echo "$pos_number_coefetp" | sed  's/: ;TD.*//')
	    coef_tp=$(sed -E "${line_number}s/(.{$pos_letter_coef_tp})/& ${rep_coef}/" $semestername)
	    cat /dev/null > $semestername
	    echo "$coef_tp" >> $semestername

	    mkdir $semname/$uename/$modname/TP/
	    
	else
	    No=N
            etp=$(sed -E "${line_number}s/(.{$pos_letter_tp})/& ${No}/" $semestername)
            cat /dev/null > $semestername
            echo "$etp" >> $semestername
	    
	    rep_coef=N
            pos_number_coefetp=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;TD:')
            pos_letter_coef_tp=$(echo "$pos_number_coefetp" | sed  's/: ;TD.*//')
            coef_tp=$(sed -E "${line_number}s/(.{$pos_letter_coef_tp})/& ${rep_coef}/" $semestername)
            cat /dev/null > $semestername
            echo "$coef_tp" >> $semestername
	fi
	
	
	pos_number_td=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;ETD:')
        pos_letter_td=$(echo "$pos_number_td" | sed  's/: ;ETD.*//')
	echo "Do you want add TD ? TAP Y or N"
	read rep_td
	if [[ $rep_td =~ ^[Yy]$ ]]
	then
	    Yes_td=Y
	    etd=$(sed -E "${line_number}s/(.{$pos_letter_td})/& ${Yes_td}/" $semestername)
	    cat /dev/null > $semestername
	    echo "$etd" >> $semestername
	    
	    echo -e "\nEnter coef  : "
	    read rep_coef_td
	    pos_number_coefetd=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;CM:')
	    pos_letter_coef_td=$(echo "$pos_number_coefetd" | sed  's/: ;CM.*//')
	    coef_td=$(sed -E "${line_number}s/(.{$pos_letter_coef_td})/& ${rep_coef_td}/" $semestername)
	    cat /dev/null > $semestername
	    echo "$coef_td" >> $semestername
	    
	    mkdir $semname/$uename/$modname/TD/
	    
	else
	    No_td=N
            etd=$(sed -E "${line_number}s/(.{$pos_letter_td})/& ${No_td}/" $semestername)
            cat /dev/null > $semestername
            echo "$etd" >> $semestername
	    
	    rep_coef_td=N
            pos_number_coefetd=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;CM:')
            pos_letter_coef_td=$(echo "$pos_number_coefetd" | sed  's/: ;CM.*//')
            coef_td=$(sed -E "${line_number}s/(.{$pos_letter_coef_td})/& ${rep_coef_td}/" $semestername)
            cat /dev/null > $semestername
            echo "$coef_td" >> $semestername
	fi
	
	pos_number_cm=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;ECM:')
        pos_letter_cm=$(echo "$pos_number_cm" | sed  's/: ;ECM.*//')
	echo "Do you want add CM ? TAP Y or N"
	read rep_cm
	if [[ $rep_cm =~ ^[Yy]$ ]]
	then
	    Yes_cm=Y
	    ecm=$(sed -E "${line_number}s/(.{$pos_letter_cm})/& ${Yes_cm}/" $semestername)
	    cat /dev/null > $semestername
	    echo "$ecm" >> $semestername
	    
	    echo -e "\nEnter coef : "
	    read rep_coef_cm
	    pos_number_coefecm=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;DE:')
	    pos_letter_coef_cm=$(echo "$pos_number_coefecm" | sed  's/: ;DE.*//')
	    coef_cm=$(sed -E "${line_number}s/(.{$pos_letter_coef_cm})/& ${rep_coef_cm}/" $semestername)
	    cat /dev/null > $semestername
	    echo "$coef_cm" >> $semestername
	    
	    mkdir $semname/$uename/$modname/CM/
	    
	else
	    No_cm=N
            ecm=$(sed -E "${line_number}s/(.{$pos_letter_cm})/& ${No_cm}/" $semestername)
            cat /dev/null > $semestername
            echo "$ecm" >> $semestername
	    
	    rep_coef_cm=N
            pos_number_coefecm=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;DE:')
            pos_letter_coef_cm=$(echo "$pos_number_coefecm" | sed  's/: ;DE.*//')
            coef_cm=$(sed -E "${line_number}s/(.{$pos_letter_coef_cm})/& ${rep_coef_cm}/" $semestername)
            cat /dev/null > $semestername
            echo "$coef_cm" >> $semestername
	fi
	
	pos_number_de=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;EDE:')
        pos_letter_de=$(echo "$pos_number_de" | sed  's/: ;EDE.*//')
	echo "Do you want add DE ? TAP Y or N"
	read rep_de
	if [[ $rep_de =~ ^[Yy]$ ]]
	then
	    Yes_de=Y
	    ede=$(sed -E "${line_number}s/(.{$pos_letter_de})/& ${Yes_de}/" $semestername)
	    cat /dev/null > $semestername
	    echo "$ede" >> $semestername
	    
	    echo -e "\nEnter coef  : "
	    read rep_coef_de
	    pos_number_coefede=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;CE:')
	    pos_letter_coef_de=$(echo "$pos_number_coefede" | sed  's/: ;CE.*//')
	    coef_de=$(sed -E "${line_number}s/(.{$pos_letter_coef_de})/& ${rep_coef_de}/" $semestername)
	    cat /dev/null > $semestername
	    echo "$coef_de" >> $semestername
	    
	    mkdir $semname/$uename/$modname/DE/
	    
	else
	    No_de=N
            ede=$(sed -E "${line_number}s/(.{$pos_letter_de})/& ${No_de}/" $semestername)
            cat /dev/null > $semestername
            echo "$ede" >> $semestername
	    
	    rep_coef_de=N
            pos_number_coefede=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;CE:')
            pos_letter_coef_de=$(echo "$pos_number_coefede" | sed  's/: ;CE.*//')
            coef_de=$(sed -E "${line_number}s/(.{$pos_letter_coef_de})/& ${rep_coef_de}/" $semestername)
            cat /dev/null > $semestername
            echo "$coef_de" >> $semestername
	fi
	
	pos_number_ce=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;ECE:')
	pos_letter_ce=$(echo "$pos_number_ce" | sed  's/: ;ECE.*//')
	echo "Do you want add CE ? TAP Y or N"
	read rep_ce
	if [[ $rep_ce =~ ^[Yy]$ ]]
	then
	    Yes_ce=Y
	    ece=$(sed -E "${line_number}s/(.{$pos_letter_ce})/& ${Yes_ce}/" $semestername)
	    cat /dev/null > $semestername
	    echo "$ece" >> $semestername
	    
	    echo -e "\nEnter coef  : "
	    read rep_coef_ce
	    pos_number_coefece=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;FINISH')
	    pos_letter_coef_ce=$(echo "$pos_number_coefece" | sed  's/: ;FINISH.*//')
	    coef_ce=$(sed -E "${line_number}s/(.{$pos_letter_coef_ce})/& ${rep_coef_ce}/" $semestername)
	    cat /dev/null > $semestername
	    echo "$coef_ce" >> $semestername
	    
	    mkdir $semname/$uename/$modname/CE/
	    
	elif [[ $rep -eq 3 ]]
	then
	    echo -e "\nWhich Semester do you want to add a Module?"
	    listsem=$(ls -d *[0-9])
	    echo -e "\nThis is what you have :\n$listsem"
	    echo -e "\nInsert the number of the semester:"
	    read semester
	    semname="S$semester"
	    semestername="semester_S$semester.info"
            echo -e "\nWhich UE do you want to add a TP ?"
	    ue=$(grep -Eo '^[^ ]+' $semestername)
	    echo -e "\nThis is what you have :\n$ue"
	    echo -e "\nInsert the name UE who you want to add a TP ?"
	    read uename
	    line_number=$(grep -n ''$uename'' $semestername | sed 's/^\([0-9]\+\):.*$/\1/')
	    
	    echo -e "\nWhich Module do you want to add a TP ?"
	    fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
	    listmod=$(echo $fline | sed 's/.*;MO://; s/;.*//')
	    echo -e "\nThis is what you have :\n$listmod"
	    echo -e "\nInsert the name of the Module who you want to add a TP :"
	    read modname
	    
	    echo -e "\nInsert the coef of the TP :"
	    read coeftp
	    
	    list1=$(echo $fline | sed 's/.*;TP://; s/;.*//')
	    list2=$(echo $fline | sed 's/.*;COEFTP://; s/;.*//')
	    
	    V1=($list1)
	    V2=($list2)
	    
	    Vm=($listmod)
	    
	    for i in "${!Vm[@]}"; do
		if [[ $modname = ${Vm[i]} ]]
		then
		    ipos=$i
		fi
	    done
	    
	    for i in "${!V1[@]}"; do
		if [[ $i -eq 0 && $i -eq $ipos ]]
		then
		    newstringtm="$tmname:Y"
		    newstringtmcoef="COEF$tmname:$coeftp"
		elif [[ $i -eq 0 && $i != $ipos ]]
		then
		    newstringtm="$tmname:${V1[i]}"
		    newstringtmcoef="COEF$tmname:${V2[i]}"
		elif [[ $i -eq $ipos ]]
		then
		    newstringtm="$newstringtm Y"
		    newstringtmcoef="$newstringtmcoef $coeftp"
		else
		    newstringtm="$newstringtm ${V1[i]}"
		    newstringtmcoef="$newstringtmcoef ${V2[i]}"
		fi
	    done
	    stringtm="$tmname:$list1"
	    stringtmcoef="COEF$tmname:$list2"
	    
	    addtm=$(sed -e ''$fcline's/'"$stringtm"'/'"$newstringtm"'/' -e ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' $semestername )
	    cat /dev/null > $semestername
	    echo -n "$addtm" >> $semestername
	    
	    mkdir $semname/$uename/$modname/TP/
	    
	    
	elif [[ $rep -eq 4 ]]
	then
	    echo -e "\nWhich Semester do you want to add a Module?"
	    listsem=$(ls -d *[0-9])
	    echo -e "\nThis is what you have :\n$listsem"
	    echo -e "\nInsert the number of the semester:"
	    read semester
	    semname="S$semester"
	    semestername="semester_S$semester.info"
            echo -e "\nWhich UE do you want to add a TD ?"
	    ue=$(grep -Eo '^[^ ]+' $semestername)
	    echo -e "\nThis is what you have :\n$ue"
	    echo -e "\nInsert the name UE who you want to add a TD ?"
	    read uename
	    line_number=$(grep -n ''$uename'' $semestername | sed 's/^\([0-9]\+\):.*$/\1/')
	    
	    echo -e "\nWhich Module do you want to add a TD ?"
	    fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
	    listmod=$(echo $fline | sed 's/.*;MO://; s/;.*//')
	    echo -e "\nThis is what you have :\n$listmod"
	    echo -e "\nInsert the name of the Module who you want to add a TD :"
	    read modname
	    
	    echo -e "\nInsert the coef of the TD :"
	    read coeftd
	    
	    list1=$(echo $fline | sed 's/.*;TD://; s/;.*//')
	    list2=$(echo $fline | sed 's/.*;COEFTD://; s/;.*//')
	    
	    V1=($list1)
	    V2=($list2)
	    
	    Vm=($listmod)
	    
	    for i in "${!Vm[@]}"; do
		if [[ $modname = ${Vm[i]} ]]
		then
		    ipos=$i
		fi
	    done
	    
	    for i in "${!V1[@]}"; do
		if [[ $i -eq 0 && $i -eq $ipos ]]
		then
		    newstringtm="$tmname:Y"
		    newstringtmcoef="COEF$tmname:$coeftd"
		elif [[ $i -eq 0 && $i != $ipos ]]
		then
		    newstringtm="$tmname:${V1[i]}"
		    newstringtmcoef="COEF$tmname:${V2[i]}"
		elif [[ $i -eq $ipos ]]
		then
		    newstringtm="$newstringtm Y"
		    newstringtmcoef="$newstringtmcoef $coeftd"
		else
		    newstringtm="$newstringtm ${V1[i]}"
		    newstringtmcoef="$newstringtmcoef ${V2[i]}"
		fi
	    done
	    stringtm="$tmname:$list1"
	    stringtmcoef="COEF$tmname:$list2"
	    
	    addtm=$(sed -e ''$fcline's/'"$stringtm"'/'"$newstringtm"'/' -e ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' $semestername )
	    cat /dev/null > $semestername
	    echo -n "$addtm" >> $semestername
	    
	    mkdir $semname/$uename/$modname/TD/
	    
	elif [[ $rep -eq 5 ]]
	then
	    echo -e "\nWhich Semester do you want to add a Module?"
	    listsem=$(ls -d *[0-9])
	    echo -e "\nThis is what you have :\n$listsem"
	    echo -e "\nInsert the number of the semester:"
	    read semester
	    semname="S$semester"
	    semestername="semester_S$semester.info"
            echo -e "\nWhich UE do you want to add a CM ?"
	    ue=$(grep -Eo '^[^ ]+' $semestername)
	    echo -e "\nThis is what you have :\n$ue"
	    echo -e "\nInsert the name UE who you want to add a CM ?"
	    read uename
	    line_number=$(grep -n ''$uename'' $semestername | sed 's/^\([0-9]\+\):.*$/\1/')
	    
	    echo -e "\nWhich Module do you want to add a CM ?"
	    fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
	    listmod=$(echo $fline | sed 's/.*;MO://; s/;.*//')
	    echo -e "\nThis is what you have :\n$listmod"
	    echo -e "\nInsert the name of the Module who you want to add a CM :"
	    read modname
	    
	    echo -e "\nInsert the coef of the CM :"
	    read coefcm
	    
	    list1=$(echo $fline | sed 's/.*;CM://; s/;.*//')
	    list2=$(echo $fline | sed 's/.*;COEFCM://; s/;.*//')
	    
	    V1=($list1)
	    V2=($list2)
	    
	    Vm=($listmod)
	    
	    for i in "${!Vm[@]}"; do
		if [[ $modname = ${Vm[i]} ]]
		then
		    ipos=$i
		fi
	    done
	    
	    for i in "${!V1[@]}"; do
		if [[ $i -eq 0 && $i -eq $ipos ]]
		then
		    newstringtm="$tmname:Y"
		    newstringtmcoef="COEF$tmname:$coefcm"
		elif [[ $i -eq 0 && $i != $ipos ]]
		then
		    newstringtm="$tmname:${V1[i]}"
		    newstringtmcoef="COEF$tmname:${V2[i]}"
		elif [[ $i -eq $ipos ]]
		then
		    newstringtm="$newstringtm Y"
		    newstringtmcoef="$newstringtmcoef $coefcm"
		else
		    newstringtm="$newstringtm ${V1[i]}"
		    newstringtmcoef="$newstringtmcoef ${V2[i]}"
		fi
	    done
	    stringtm="$tmname:$list1"
	    stringtmcoef="COEF$tmname:$list2"
	    
	    addtm=$(sed -e ''$fcline's/'"$stringtm"'/'"$newstringtm"'/' -e ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' $semestername )
	    cat /dev/null > $semestername
	    echo -n "$addtm" >> $semestername
	    
	    mkdir $semname/$uename/$modname/CM/
	    
	elif [[ $rep -eq 6 ]]
	then
	    echo -e "\nWhich Semester do you want to add a Module?"
	    listsem=$(ls -d *[0-9])
	    echo -e "\nThis is what you have :\n$listsem"
	    echo -e "\nInsert the number of the semester:"
	    read semester
	    semname="S$semester"
	    semestername="semester_S$semester.info"
            echo -e "\nWhich UE do you want to add a DE ?"
	    ue=$(grep -Eo '^[^ ]+' $semestername)
	    echo -e "\nThis is what you have :\n$ue"
	    echo -e "\nInsert the name UE who you want to add a DE ?"
	    read uename
	    line_number=$(grep -n ''$uename'' $semestername | sed 's/^\([0-9]\+\):.*$/\1/')
	    
	    echo -e "\nWhich Module do you want to add a DE ?"
	    fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
	    listmod=$(echo $fline | sed 's/.*;MO://; s/;.*//')
	    echo -e "\nThis is what you have :\n$listmod"
	    echo -e "\nInsert the name of the Module who you want to add a DE :"
	    read modname
	    
	    echo -e "\nInsert the coef of the DE :"
	    read coefde
	    
	    list1=$(echo $fline | sed 's/.*;DE://; s/;.*//')
	    list2=$(echo $fline | sed 's/.*;COEFDE://; s/;.*//')
	    
	    V1=($list1)
	    V2=($list2)
	    
	    Vm=($listmod)
	    
	    for i in "${!Vm[@]}"; do
		if [[ $modname = ${Vm[i]} ]]
		then
		    ipos=$i
		fi
	    done
	    
	    for i in "${!V1[@]}"; do
		if [[ $i -eq 0 && $i -eq $ipos ]]
		then
		    newstringtm="$tmname:Y"
		    newstringtmcoef="COEF$tmname:$coefde"
		elif [[ $i -eq 0 && $i != $ipos ]]
		then
		    newstringtm="$tmname:${V1[i]}"
		    newstringtmcoef="COEF$tmname:${V2[i]}"
		elif [[ $i -eq $ipos ]]
		then
		    newstringtm="$newstringtm Y"
		    newstringtmcoef="$newstringtmcoef $coefde"
		else
		    newstringtm="$newstringtm ${V1[i]}"
		    newstringtmcoef="$newstringtmcoef ${V2[i]}"
		fi
	    done
	    stringtm="$tmname:$list1"
	    stringtmcoef="COEF$tmname:$list2"
	    
	    addtm=$(sed -e ''$fcline's/'"$stringtm"'/'"$newstringtm"'/' -e ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' $semestername )
	    cat /dev/null > $semestername
	    echo -n "$addtm" >> $semestername
	    
	    mkdir $semname/$uename/$modname/DE/
	    
	elif [[ $rep -eq 7 ]]
	then
	    echo -e "\nWhich Semester do you want to add a Module?"
	    listsem=$(ls -d *[0-9])
	    echo -e "\nThis is what you have :\n$listsem"
	    echo -e "\nInsert the number of the semester:"
	    read semester
	    semname="S$semester"
	    semestername="semester_S$semester.info"
            echo -e "\nWhich UE do you want to add a CE ?"
	    ue=$(grep -Eo '^[^ ]+' $semestername)
	    echo -e "\nThis is what you have :\n$ue"
	    echo -e "\nInsert the name UE who you want to add a CE ?"
	    read uename
	    line_number=$(grep -n ''$uename'' $semestername | sed 's/^\([0-9]\+\):.*$/\1/')
	    
	    echo -e "\nWhich Module do you want to add a CE ?"
	    fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
	    listmod=$(echo $fline | sed 's/.*;MO://; s/;.*//')
	    echo -e "\nThis is what you have :\n$listmod"
	    echo -e "\nInsert the name of the Module who you want to add a CE :"
	    read modname
	    
	    echo -e "\nInsert the coef of the CE :"
	    read coefce
	    
	    list1=$(echo $fline | sed 's/.*;CE://; s/;.*//')
	    list2=$(echo $fline | sed 's/.*;COEFCE://; s/;.*//')
	    
	    V1=($list1)
	    V2=($list2)
	    
	    for i in "${!V1[@]}"; do
		if [[ $i -eq 0 && $i -eq $ipos ]]
		then
		    newstringtm="$tmname:Y"
		    newstringtmcoef="COEF$tmname:$coefce"
		elif [[ $i -eq 0 && $i != $ipos ]]
		then
		    newstringtm="$tmname:${V1[i]}"
		    newstringtmcoef="COEF$tmname:${V2[i]}"
		elif [[ $i -eq $ipos ]]
		then
		    newstringtm="$newstringtm Y"
		    newstringtmcoef="$newstringtmcoef $coefce"
		else
		    newstringtm="$newstringtm ${V1[i]}"
		    newstringtmcoef="$newstringtmcoef ${V2[i]}"
		fi
	    done
	    stringtm="$tmname:$list1"
	    stringtmcoef="COEF$tmname:$list2"
	    
	    addtm=$(sed -e ''$fcline's/'"$stringtm"'/'"$newstringtm"'/' -e ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' $semestername )
	    cat /dev/null > $semestername
	    echo -n "$addtm" >> $semestername

	    mkdir $semname/$ue/$modname/CE/
	    
	else
	    No_ce=N
            ece=$(sed -E "${line_number}s/(.{$pos_letter_ce})/& ${No_ce}/" $semestername)
            cat /dev/null > $semestername
            echo "$ece" >> $semestername
	    
	    rep_coef_ce=N
            pos_number_coefece=$( cat $semestername | sed -n "${line_number}p" | grep -aob ' ;FINISH')
            pos_letter_coef_ce=$(echo "$pos_number_coefece" | sed  's/: ;FINISH.*//')
            coef_ce=$(sed -E "${line_number}s/(.{$pos_letter_coef_ce})/& ${rep_coef_ce}/" $semestername)
            cat /dev/null > $semestername
            echo "$coef_ce" >> $semestername
	fi
	
    else
	echo "Error option: Program Shutdown"
        ext=1
    fi
    
    
    
elif [[ $adel = modify ]] || [[ $adel = MODIFY ]]
then
    echo -e "\nWhat do you want to modify ?"
    echo "Enter your choice"
    echo "1. A Semester"
    echo "2. A UE or a Module or a Teaching Methods"
    echo "Exit"
    
    read rep
    if [[ $rep -eq 1 ]]
    then
	echo -e "\nWhich Semester do you want to modify?"
	listsem=$(ls -d *[0-9])
	echo -e "\nThis is what you have :\n$listsem"
	echo -e "\nInsert the number of the semester:"
	read semester
	semname="S$semester"	
	semestername="semester_S$semester.info"
	
	echo -e "\nWhat do you want to modify in this Semester?"
	echo "Enter your choice"
	echo "1. The Semester"
	echo "Exit"

	read repsem
	if [[ $repsem -eq 1 ]]       #Modify Semester
	then
	    echo -e "\nInsert the new number of the Semester?"
	    read newsemester
	    
	    mv $semname /$newsemname
	else
	    echo "Error option: Program Shutdown"
            ext=1
	fi
	
    elif [[ $rep -eq 2 ]]
    then
	echo -e "\nWhich Semester do you want to modify something?"
	listsem=$(ls -d *[0-9])
	echo -e "\nThis is what you have :\n$listsem"
	echo -e "\nInsert the number of the semester:"
	read semester
	semname="S$semester"
	semestername="semester_S$semester.info"
	
	echo -e "\nWhat do you want to modify in this Semester"
	echo "Enter your choice"
	echo "1. A UE"
	echo "2. A Module or a Teaching Methods"	
	echo "Exit"
	
	read rep2
	if [[ $rep2 -eq 1 ]]
	then
	    ue=$(grep -Eo '^[^ ]+' $semestername)
	    echo -e "\nThis is all of your UE :\n$ue"
	    echo -e "\nWhich UE do you want to select?"
	    read uename
	    
	    fcline=$(grep -n "$uename" $semestername | cut -d: -f1)
	    
	    echo -e "\nWhat do you want to modify in this UE?"
	    echo "Enter your choice"
	    echo "1. The UE"
	    echo "2. The Coef of the UE"
	    echo "Exit"
	    
	    read repue
	    if [[ $repue -eq 1 ]]	#Modify UE
            then		
		fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
		list=$(echo $fline | sed 's/.*UE://; s/;COEFUE.*//')

		echo -e "\nInsert the new name of the UE?"
		read newuename
		
		modue=$(sed ''$fcline's/'$unname'/'$newuename'/' $semestername)
		cat /dev/null > $semestername
		echo -n "$modue" >> $semestername

		mv $semname/$uename $semname/$newuename
		
            elif [[ $repue -eq 2 ]]	#Modify coef UE
            then
		
		fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
                list=$(echo $fline | sed 's/.*COEFUE://; s/;MO.*//')
		
		echo -e "\nInsert the new coef of the UE?"
                read newuecoef
		
		stringuecoef="COEFUE:$list"
		newstringuecoef="COEFUE:$newuecoef"
		
		moduecoef=$(sed ''$fcline's/'"$stringuecoef"'/'"$newstringuecoef"'/' $semestername)
                cat /dev/null > $semestername
                echo -n "$moduecoef" >> $semestername
		
            else
		echo "Error option: Program Shutdown"
		ext=1
            fi
	    
	elif [[ $rep2 -eq 2 ]]
	then
	    ue=$(grep -Eo '^[^ ]+' $semestername)
	    echo -e "\nThis is all of your UE :\n$ue"
	    echo -e "\nWhich UE do you want to modify something?"
            read uename
	    
	    fcline=$(grep -n "$uename" $semestername | cut -d: -f1)
	    
	    echo -e "\nWhat do you want to modify in this UE?"
	    echo "Enter your choice"
	    echo "1. A Module"
	    echo "2. A Teaching Methods"
	    echo "Exit"
	    
	    read rep3
	    if [[ $rep3 -eq 1 ]]
	    then
		fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
                listmod=$(echo $fline | sed 's/.*MO://; s/;COEF.*//')
		echo -e "\nThis is all of your Module:\n$listmod"
		echo -e "\nWhich Module do you want to select?"
		read modname
		
                echo -e "\nWhat do you want to modify in this Module?"
                echo "Enter your choice"
                echo "1. The Module"
                echo "2. The Coef of the Module"
		echo "Exit"
		
		read repmod
		if [[ $repmod -eq 1 ]]		#Modify Module
		then		    
		    fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
                    list=$(echo $fline | sed 's/.*MO://; s/;COEF.*//')
		    
		    V=($list)
		    
                    echo -e "\nInsert the new name of the Module?"
                    read newmodname
		    
		    for i in "${!V[@]}"; do
                        if [[ $modname = ${V[i]} ]]
                        then
                            ipos=$i
                        fi
                    done
		    
		    for i in "${!V[@]}"; do
    			if [[ $i -eq 0 && $i -eq $ipos ]]
    			then
        		    newstringmodname="MO:$newmodname"
    			elif [[ $i -eq 0 && $i != $ipos ]]
    			then
    			    newstringmodname="MO:${V[i]}"
    			elif [[ $i -eq $ipos ]]
    			then
    			    newstringmodname="$string2 $newmodname"
    			else
        		    newstringmodname="$string2 ${V[i]}"
    			fi
		    done
		    
		    stringmodname="MO:$list"
		    
                    modmod=$(sed ''$fcline's/'"$stringmodname"'/'"$newstringmodname"'/' $semestername)
                    cat /dev/null > $semestername
                    echo -n "$modmod" >> $semestername

		    mv $semname/$uename/$modname $semname/$newuename/$newmodname
		    
		elif [[ $repmod -eq 2 ]]	#Modify coef Module
		then
		    fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
                    list=$(echo $fline | sed 's/.*COEF://; s/;TEACH:.*//')
		    
                    V=($list)
		    
                    echo -e "\nInsert the new coef of the Module?"
                    read newmodcoef
		    
                    for i in "${!V[@]}"; do
                        if [[ $modname = ${V[i]} ]]
                        then
                            ipos=$i
                        fi
                    done
		    
                    for i in "${!V[@]}"; do
                        if [[ $i -eq 0 && $i -eq $ipos ]]
                        then
                            newstringmodcoef="COEF:$newmodcoef"
                        elif [[ $i -eq 0 && $i != $ipos ]]
                        then
                            newstringmodcoef="COEF:${V[i]}"
                        elif [[ $i -eq $ipos ]]
                        then
                            newstringmodcoef="$newstringmodcoef $newmodcoef"
                        else
                            newstringmodcoef="$newstringmodcoef ${V[i]}"
                        fi
                    done
		    
                    stringmodcoef="COEF:$list"
		    
                    modmodcoef=$(sed ''$fcline's/'"$stringmodcoef"'/'"$newstringmodcoef"'/' $semestername)
                    cat /dev/null > $semestername
                    echo -n "$modmodcoef" >> $semestername
		    
		else
		    echo "Error option: Program Shutdown"
		    ext=1
		fi
		
		
	    elif [[ $rep3 -eq 2 ]]
	    then
		fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
                listmod=$(echo $fline | sed 's/.*MO://; s/;COEF.*//')
		echo -e "\nThis is all of your Module:\n$listmod"
		echo -e "\nWhich Module do you want to select before selecting teaching methods?"
                read modname
		
		
	        echo -e "\nWhich Teaching Methods do you want to select?\n[TP / TD / CM / DE / CE]"
		read tmname
		
		echo -e "\nWhat do you want to modify in this Teaching Methods?"
                echo "Enter your choice"
                echo "1. The Teaching Methods"
                echo "2. The Coef of the Teaching Methods"
		echo "Exit"
		read repteach
		
		if [[ $repteach -eq 1 ]]	#Modify Teaching Methods
		then
                    echo "You can't modify the name of a teaching methods. It is only addable or deletable" 
		    
		elif [[ $repteach -eq 2 ]]	#Modify coef Teaching Methods
		then
		    if [[  $tmname = "TP" ]] || [[ $tmname = "tp" ]]
		    then
			fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
			list=$(echo $fline | sed 's/.*COEFTP://; s/;.*//')
			
			V=($list)
			
			echo -e "\nInsert the new coef of the Teaching Methods?"
			read newtmcoef
			
			for i in "${!V[@]}"; do
                            if [[ $i -eq 0 && $i -eq $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:$newtmcoef"
                            elif [[ $i -eq 0 && $i != $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:${V[i]}"
                            elif [[ $i -eq $ipos ]]
                            then
				newstringtmcoef="$newstringtmcoef $newtmcoef"
                            else
				newstringtmcoef="$newstringtmcoef ${V[i]}"
                            fi
			done
			
                    stringtmcoef="COEF$tmname:$list"
		    
                    modtmcoef=$(sed ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' $semestername)
                    cat /dev/null > $semestername
                    echo -n "$modtmcoef" >> $semestername
		    
		    elif [[ $tmname = "TD" ]] || [[ $tmname = "td" ]]
		    then
			fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
			list=$(echo $fline | sed 's/.*COEFTD://; s/;.*//')
			
			V=($list)
			
			echo -e "\nInsert the new coef of the Teaching Methods?"
			read newtmcoef
			
			for i in "${!V[@]}"; do
                            if [[ $i -eq 0 && $i -eq $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:$newtmcoef"
                            elif [[ $i -eq 0 && $i != $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:${V[i]}"
                            elif [[ $i -eq $ipos ]]
                            then
				newstringtmcoef="$newstringtmcoef $newtmcoef"
                            else
				newstringtmcoef="$newstringtmcoef ${V[i]}"
                            fi
			done
			
			stringtmcoef="COEF$tmname:$list"
			
			modtmcoef=$(sed ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' $semestername)
			cat /dev/null > $semestername
			echo -n "$modtmcoef" >> $semestername
			
                    elif [[ $tmname = "CM" ]] || [[ $tmname = "cm" ]]
                    then
			fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
			list=$(echo $fline | sed 's/.*COEFCM://; s/;.*//')
			
			V=($list)
			
			echo -e "\nInsert the new coef of the Teaching Methods?"
			read newtmcoef
			
			for i in "${!V[@]}"; do
                            if [[ $i -eq 0 && $i -eq $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:$newtmcoef"
                            elif [[ $i -eq 0 && $i != $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:${V[i]}"
                            elif [[ $i -eq $ipos ]]
                            then
				newstringtmcoef="$newstringtmcoef $newtmcoef"
                            else
				newstringtmcoef="$newstringtmcoef ${V[i]}"
                            fi
			done
			
			stringtmcoef="COEF$tmname:$list"
			
			modtmcoef=$(sed ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' $semestername)
			cat /dev/null > $semestername
			echo -n "$modtmcoef" >> $semestername
			
                    elif [[ $tmname = "DE" ]] || [[ $tmname = "de" ]]
                    then
			fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
			list=$(echo $fline | sed 's/.*COEFDE://; s/;.*//')
			
			V=($list)
			
			echo -e "\nInsert the new coef of the Teaching Methods?"
			read newtmcoef
			
			for i in "${!V[@]}"; do
                            if [[ $i -eq 0 && $i -eq $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:$newtmcoef"
                            elif [[ $i -eq 0 && $i != $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:${V[i]}"
                            elif [[ $i -eq $ipos ]]
                            then
				newstringtmcoef="$newstringtmcoef $newtmcoef"
                            else
				newstringtmcoef="$newstringtmcoef ${V[i]}"
                            fi
			done
			
			stringtmcoef="COEF$tmname:$list"
			
			modtmcoef=$(sed ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' $semestername)
			cat /dev/null > $semestername
			echo -n "$modtmcoef" >> $semestername
			
                    elif [[ $tmname = "CE" ]] || [[ $tmname = "ce" ]]
                    then
			fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
			list=$(echo $fline | sed 's/.*COEFCE://; s/;.*//')
			
			V=($list)
			
			echo -e "\nInsert the new coef of the Teaching Methods?"
			read newtmcoef
			
			for i in "${!V[@]}"; do
                            if [[ $i -eq 0 && $i -eq $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:$newtmcoef"
                            elif [[ $i -eq 0 && $i != $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:${V[i]}"
                            elif [[ $i -eq $ipos ]]
                            then
				newstringtmcoef="$newstringtmcoef $newtmcoef"
                            else
				newstringtmcoef="$newstringtmcoef ${V[i]}"
                            fi
			done
			
			stringtmcoef="COEF$tmname:$list"
			
			modtmcoef=$(sed ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' $semestername)
			cat /dev/null > $semestername
			echo -n "$modtmcoef" >> $semestername
		    else
			echo "Error option: Program Shutdown"
		    fi
		    
		else
		    echo "Error option: Program Shutdown"
		    ext=1
		fi
		
	    else
		echo "Error option: Program Shutdown"
        	ext=1
	    fi
	    
    	else
	    echo "Error option: Program Shutdown"
            ext=1
        fi
	
    else
    	echo "Error option: Program Shutdown"
    	ext=1
    fi
    
elif [[ $adel = delete ]] || [[ $adel = DELETE ]]
then
    echo -e "\nWhat do you want to delete ?"
    echo "Enter your choice"
    echo "1. A Semester"
    echo "2. A UE or a Module or a Teaching Methods"
    echo "Exit"
    
    read rep
    if [[ $rep -eq 1 ]]
    then
	echo -e "\nWhich Semester do you want to delete something?"
	listsem=$(ls -d *[0-9])
	echo -e "\nThis is what you have :\n$listsem"
	echo -e "\nInsert the number of the semester:"
	read semester
	semname="S$semester"
	semestername="semester_S$semester.info"
	
	echo -e "\nWhich Semester do you want to select?"
	read semname
	
	echo -e "\nWhat do you want to delete in this Semester?"
	echo "Enter your choice"
	echo "1. The Semester"
	echo "Exit"
	
	read repsem
	if [[ $repsem -eq 1 ]]     #Delete Semester
	then
	   rm -rf $semname
	else
	    echo "Error option: Program Shutdown"
            ext=1
	fi
	
    elif [[ $rep -eq 2 ]]
    then
	echo -e "\nWhich Semester do you want to delete something?"
	listsem=$(ls -d *[0-9])
	echo -e "\nThis is what you have :\n$listsem"
	echo -e "\nInsert the number of the semester:"
	read semester
	semname="S$semester"
	semestername="semester_S$semester.info"
	
	echo -e "\nWhat do you want to delete in this Semester"
	echo "Enter your choice"
	echo "1. A UE"
	echo "2. A Module or a Teaching Methods"
	echo "Exit"
	
	read rep2
	if [[ $rep2 -eq 1 ]]
	then
	    ue=$(grep -Eo '^[^ ]+' $semestername)
	    echo -e "\nThis is all of your UE :\n$ue"
	    echo -e "\nWhich UE do you want to select?"
	    read uename
	    
	    fcline=$(grep -n "$uename" $semestername | cut -d: -f1)
	    
	    echo -e "\nWhat do you want to delete in this UE?"
	    echo "Enter your choice"
	    echo "1. The UE"
	    echo "2. The Coef of the UE"
	    echo "Exit"
	    
	    read repue
	    if [[ $repue -eq 1 ]]	#Delete UE
            then
		
		fcline=$(grep -n "$uename" $semestername | cut -d: -f1)
		fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
		
		listcue=$(echo $fline | sed 's/.*;COEFUE://; s/;.*//')
		listmod1=$(echo $fline | sed 's/.*;MO://; s/;.*//')
		listmod2=$(echo $fline | sed 's/.*;COEF://; s/;.*//')
		listteach=$(echo $fline | sed 's/.*;TEACH://; s/;.*//')
		listmteach=$(echo $fline | sed 's/.*;EMAILTEACH://; s/;.*//')
		listtp1=$(echo $fline | sed 's/.*;TP://; s/;.*//')
		listtp2=$(echo $fline | sed 's/.*;ETP://; s/;.*//')
		listtp3=$(echo $fline | sed 's/.*;COEFTP://; s/;.*//')
		listtd1=$(echo $fline | sed 's/.*;TD://; s/;.*//')
		listtd2=$(echo $fline | sed 's/.*;ETD://; s/;.*//')
		listtd3=$(echo $fline | sed 's/.*;COEFTD://; s/;.*//')
		listcm1=$(echo $fline | sed 's/.*;CM://; s/;.*//')
		listcm2=$(echo $fline | sed 's/.*;ECM://; s/;.*//')
		listcm3=$(echo $fline | sed 's/.*;COEFCM://; s/;.*//')
		listde1=$(echo $fline | sed 's/.*;DE://; s/;.*//')
		listde2=$(echo $fline | sed 's/.*;EDE://; s/;.*//')
		listde3=$(echo $fline | sed 's/.*;COEFDE://; s/;.*//')
		listce1=$(echo $fline | sed 's/.*;CE://; s/;.*//')
		listce2=$(echo $fline | sed 's/.*;ECE://; s/;.*//')
		listce3=$(echo $fline | sed 's/.*;COEFCE://; s/;.*//')
		
		stringcue="COEFUE:$listcue"
		stringmod1="MO:$listmod1"
		stringmod2="COEF:$listmod2"
		stringteach="TEACH:$listteach"
		stringmteach="EMAILTEACH:$listmteach"
		stringtmtp1="TP:$listtp1"
		stringtmtp2="ETP:$listtp2"
		stringtmtp3="COEFTP:$listtp3"
		stringtmtd1="TD:$listtd1"
		stringtmtd2="ETD:$listtd2"
		stringtmtd3="COEFTD:$listtd3"
		stringtmcm1="CM:$listcm1"
		stringtmcm2="ECM:$listcm2"
		stringtmcm3="COEFCM:$listcm3"
		stringtmde1="DE:$listde1"
		stringtmde2="EDE:$listde2"
		stringtmde3="COEFDE:$listde3"
		stringtmce1="CE:$listce1"
		stringtmce2="ECE:$listce2"
		stringtmce3="COEFCE:$listce3"
		
		delue=$(sed -e ''$fcline's/'"$uename"'//' -e ''$fcline's/'"$stringcue"'/COEFUE:/' -e ''$fcline's/'"$stringmod1"'/MOD:/' -e ''$fcline's/'"$stringmod2"'/COEF/' -e ''$fcline's/'"$stringteach"'/TEACH:/' -e ''$fcline's/'"$stringmteach"'/EMAILTEACH:/' -e ''$fcline's/'"$stringtmtp1"'/TP:/' -e ''$fcline's/'"$stringtmtp2"'/ETP:/' -e ''$fcline's/'"$stringtmtp3"'/COEFTP:/' -e ''$fcline's/'"$stringtmtd1"'/TD:/' -e ''$fcline's/'"$stringtmtd2"'/ETD:/' -e ''$fcline's/'"$stringtmtd3"'/COEFTD:/' -e ''$fcline's/'"$stringtmcm1"'/CM:/' -e ''$fcline's/'"$stringtmcm2"'/ECM:/' -e ''$fcline's/'"$stringtmcm3"'/COEFCM:/' -e ''$fcline's/'"$stringtmde1"'/DE:/' -e ''$fcline's/'"$stringtmde2"'/EDE:/' -e ''$fcline's/'"$stringtmde3"'/COEFDE:/' -e ''$fcline's/'"$stringtmce1"'/CE:/' -e ''$fcline's/'"$stringtmce2"'/ECE:/' -e ''$fcline's/'"$stringtmce3"'/COEFCE:/' semester_sheet.txt )
		cat /dev/null > $semestername
		echo -n "$delue" >> $semestername

		rm -rf $semname/$uename
		
            elif [[ $repue -eq 2 ]]	#Delete coef UE
            then
		fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
		list=$(echo $fline | sed 's/.*COEFUE://; s/;MO.*//')
		
       		stringuecoef="COEFUE:$list"
       		newstringuecoef="COEFUE:X"
		
       		deluecoef=$(sed ''$fcline's/'"$stringuecoef"'/'"$newstringuecoef"'/' $semestername)
		cat /dev/null > $semestername
		echo -n "$deluecoef" >> $semestername
	       
            else
		echo "Error option: Program Shutdown"
		ext=1
            fi
	    
	elif [[ $rep2 -eq 2 ]]
	then
	    ue=$(grep -Eo '^[^ ]+' $semestername)
	    echo -e "\nThis is all of your UE :\n$ue"
	    echo -e "\nWhich UE do you want to delete something?"
            read uename
	    
	    fcline=$(grep -n "$uename" $semestername | cut -d: -f1)
	    
	    echo -e "\nWhat do you want to delete in this UE?"
	    echo "Enter your choice"
	    echo "1. A Module"
	    echo "2. A Teaching Methods"
	    echo "Exit"
	    
	    read rep3
	    if [[ $rep3 -eq 1 ]]
	    then
		fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
                listmod=$(echo $fline | sed 's/.*MO://; s/;COEF.*//')
		echo -e "\nThis is all of your Module:\n$listmod"
		echo -e "\nWhich Module do you want to select?"
		read modname

                echo -e "\nWhat do you want to delete in this Module?"
                echo "Enter your choice"
                echo "1. The Module"
                echo "2. The Coef of the Module"
		echo "Exit"
		
		read repmod
		if [[ $repmod -eq 1 ]]		#Delete Module
		then
		    fcline=$(grep -n "$uename" $semestername | cut -d: -f1)
		    
		    fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
		    listmod1=$(echo $fline | sed 's/.*;MO://; s/;.*//')
		    listmod2=$(echo $fline | sed 's/.*;COEF://; s/;.*//')
		    listtp1=$(echo $fline | sed 's/.*;TP://; s/;.*//')
		    listtp2=$(echo $fline | sed 's/.*;ETP://; s/;.*//')
		    listtp3=$(echo $fline | sed 's/.*;COEFTP://; s/;.*//')
		    listtd1=$(echo $fline | sed 's/.*;TD://; s/;.*//')
		    listtd2=$(echo $fline | sed 's/.*;ETD://; s/;.*//')
		    listtd3=$(echo $fline | sed 's/.*;COEFTD://; s/;.*//')
		    listcm1=$(echo $fline | sed 's/.*;CM://; s/;.*//')
		    listcm2=$(echo $fline | sed 's/.*;ECM://; s/;.*//')
		    listcm3=$(echo $fline | sed 's/.*;COEFCM://; s/;.*//')
		    listde1=$(echo $fline | sed 's/.*;DE://; s/;.*//')
		    listde2=$(echo $fline | sed 's/.*;EDE://; s/;.*//')
		    listde3=$(echo $fline | sed 's/.*;COEFDE://; s/;.*//')
		    listce1=$(echo $fline | sed 's/.*;CE://; s/;.*//')
		    listce2=$(echo $fline | sed 's/.*;ECE://; s/;.*//')
		    listce3=$(echo $fline | sed 's/.*;COEFCE://; s/;.*//')
		    
		    Vm1=($listmod1)
		    Vm2=($listmod2)
		    Vtp1=($listtp1)
		    Vtp2=($listtp2)
		    Vtp3=($listtp3)
		    Vtd1=($listtd1)
		    Vtd2=($listtd2)
		    Vtd3=($listtd3)
		    Vcm1=($listcm1)
		    Vcm2=($listcm2)
		    Vcm3=($listcm3)
		    Vde1=($listde1)
		    Vde2=($listde2)
		    Vde3=($listde3)
		    Vce1=($listce1)
		    Vce2=($listce2)
		    Vce3=($listce3)
		    
		    for i in "${!Vm1[@]}"; do
			if [[ $modname = ${Vm1[i]} ]]
			then
			    ipos=$i
			fi
		    done
		    
		    for i in "${!Vm1[@]}"; do
			if [[ $i -eq 0 && $i -eq $ipos ]]
			then
			    newstringmod1="MO:"
			    newstringmod2="COEF:"
			    newstringtmtp1="TP:"
			    newstringtmtp2="ETP:"
			    newstringtmtp3="COEFTP:"
			    newstringtmtd1="TD:"
			    newstringtmtd2="ETD:"
			    newstringtmtd3="COEFTD:"
			    newstringtmcm1="CM:"
			    newstringtmcd2="ECM:"
			    newstringtmcm3="COEFCM:"
			    newstringtmde1="DE:"
			    newstringtmde2="EDE:"
			    newstringtmde3="COEFDE:"
			    newstringtmce1="CE:"
			    newstringtmce2="ECE:"
			    newstringtmce3="COEFCE:"
			elif [[ $i -eq 0 && $i != $ipos ]]
			then
			    newstringmod1="MO:${Vm1[i]}"
			    newstringmod2="COEF:${Vm2[i]}"
			    newstringtmtp1="TP:${Vtp1[i]}"
			    newstringtmtp2="ETP:${Vtp2[i]}"
			    newstringtmtp3="COEFTP:${Vtp3[i]}"
			    newstringtmtd1="TD:${Vtd1[i]}"
			    newstringtmtd2="ETD:${Vtd2[i]}"
			    newstringtmtd3="COEFTD:${Vtd3[i]}"
			    newstringtmcm1="CM:${Vcm1[i]}"
			    newstringtmcm2="ECM:${Vcm2[i]}"
			    newstringtmcm3="COEFCM:${Vcm3[i]}"
			    newstringtmde1="DE:${Vde1[i]}"
			    newstringtmde2="EDE:${Vde2[i]}"
			    newstringtmde3="COEFDE:${Vde3[i]}"
			    newstringtmce1="CE:${Vce1[i]}"
			    newstringtmce2="ECE:${Vce2[i]}"
			    newstringtmce3="COEFCE:${Vce3[i]}"
			elif [[ $i != 0 && $i -eq $ipos ]]
			then
			    newstringmod1="$newstringmod1"
			    newstringmod2="$newstringmod2"
			    newstringtmtp1="$newstringtmtp1"
			    newstringtmtp2="$newstringtmtp2"
			    newstringtmtp3="$newstringtmtp3"
			    newstringtmtd1="$newstringtmtd1"
			    newstringtmtd2="$newstringtmtd2"
			    newstringtmtd3="$newstringtmtd3"
			    newstringtmcm1="$newstringtmcm1"
			    newstringtmcm2="$newstringtmcm2"
			    newstringtmcm3="$newstringtmcm3"
			    newstringtmde1="$newstringtmde1"
			    newstringtmde2="$newstringtmde2"
			    newstringtmde3="$newstringtmde3"
			    newstringtmce1="$newstringtmce1"
			    newstringtmce2="$newstringtmce2"
			    newstringtmce3="$newstringtmce3"
			else
			    newstringmod1="$newstringmod1 ${Vm1[i]}"
			    newstringmod2="$newstringmod2 ${Vm2[i]}"
			    newstringtmtp1="$newstringtmtp1 ${Vtp1[i]}"
			    newstringtmtp2="$newstringtmtp2 ${Vtp2[i]}"
			    newstringtmtp3="$newstringtmtp3 ${Vtp3[i]}"
			    newstringtmtd1="$newstringtmtd1 ${Vtd1[i]}"
			    newstringtmtd2="$newstringtmtd2 ${Vtd2[i]}"
			    newstringtmtd3="$newstringtmtd3 ${Vtd3[i]}"
			    newstringtmcm1="$newstringtmcm1 ${Vcm1[i]}"
			    newstringtmcm2="$newstringtmcm2 ${Vcm2[i]}"
			    newstringtmcm3="$newstringtmcm3 ${Vcm3[i]}"
			    newstringtmde1="$newstringtmde1 ${Vde1[i]}"
			    newstringtmde2="$newstringtmde2 ${Vde2[i]}"
			    newstringtmde3="$newstringtmde3 ${Vde3[i]}"
			    newstringtmce1="$newstringtmce1 ${Vce1[i]}"
			    newstringtmce2="$newstringtmce2 ${Vce2[i]}"
			    newstringtmce3="$newstringtmce3 ${Vce3[i]}"
			fi
		    done
		    
		    stringmod1="MO:$listmod1"
		    stringmod2="COEF:$listmod2"
		    stringtmtp1="TP:$listtp1"
		    stringtmtp2="ETP:$listtp2"
		    stringtmtp3="COEFTP:$listtp3"
		    stringtmtd1="TD:$listtd1"
		    stringtmtd2="ETD:$listtd2"
		    stringtmtd3="COEFTD:$listtd3"
		    stringtmcm1="CM:$listcm1"
		    stringtmcm2="ECM:$listcm2"
		    stringtmcm3="COEFCM:$listcm3"
		    stringtmde1="DE:$listde1"
		    stringtmde2="EDE:$listde2"
		    stringtmde3="COEFDE:$listde3"
		    stringtmce1="CE:$listce1"
		    stringtmce2="ECE:$listce2"
		    stringtmce3="COEFCE:$listce3"
		    
		    delmod=$(sed -e ''$fcline's/'"$stringmod1"'/'"$newstringmod1"'/' -e ''$fcline's/'"$stringmod2"'/'"$newstringmod2"'/' -e ''$fcline's/'"$stringtmtp1"'/'"$newstringtmtp1"'/' -e ''$fcline's/'"$stringtmtp2"'/'"$newstringtmtp2"'/' -e ''$fcline's/'"$stringtmtp3"'/'"$newstringtmtp3"'/' -e ''$fcline's/'"$stringtmtd1"'/'"$newstringtmtd1"'/' -e ''$fcline's/'"$stringtmtd2"'/'"$newstringtmtd2"'/' -e ''$fcline's/'"$stringtmtd3"'/'"$newstringtmtd3"'/' -e ''$fcline's/'"$stringtmcm1"'/'"$newstringtmcm1"'/' -e ''$fcline's/'"$stringtmcm2"'/'"$newstringtmcm2"'/' -e ''$fcline's/'"$stringtmcm3"'/'"$newstringtmcm3"'/' -e ''$fcline's/'"$stringtmde1"'/'"$newstringtmde1"'/' -e ''$fcline's/'"$stringtmde2"'/'"$newstringtmde2"'/' -e ''$fcline's/'"$stringtmde3"'/'"$newstringtmde3"'/' -e ''$fcline's/'"$stringtmce1"'/'"$newstringtmce1"'/' -e ''$fcline's/'"$stringtmce2"'/'"$newstringtmce2"'/' -e ''$fcline's/'"$stringtmce3"'/'"$newstringtmce3"'/' semester_sheet.txt )
		    cat /dev/null > $semestername
		    echo -n "$delmod" >> $semestername

		    rm -rf $semname/$uename/$modname
		    

		elif [[ $repmod -eq 2 ]]	#Delete coef Module
		then
		    fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
		    list1=$(echo $fline | sed 's/.*;MO://; s/;.*//')
		    list2=$(echo $fline | sed 's/.*COEF://; s/;TEACH:.*//')
		    
		    V1=($list1)
		    V2=($list2)
		    
		    for i in "${!V1[@]}"; do
			if [[ $modname = ${V1[i]} ]]
			then
			    ipos=$i
			fi
		    done
		    
		    for i in "${!V1[@]}"; do
			printf 'V2[%s] = %s\n' "$i" "${V2[i]}"
			if [[ $i -eq 0 && $i -eq $ipos ]]
			then
			    newstringmodcoef="COEF:X"
			elif [[ $i -eq 0 && $i != $ipos ]]
			then
			    newstringmodcoef="COEF:${V2[i]}"
			elif [[ $i != 0 && $i -eq $ipos ]]
			then
			    newstringmodcoef="$newstringmodcoef X"
			else
			    newstringmodcoef="$newstringmodcoef ${V2[i]}"
			fi
		    done
		    
		    stringmodcoef="COEF:$list2"
		    
		    delmodcoef=$(sed ''$fcline's/'"$stringmodcoef"'/'"$newstringmodcoef"'/' $semestername)
                    cat /dev/null > $semestername
                    echo -n "$delmodcoef" >> $semestername

		else
		    echo "Error option: Program Shutdown"
		    ext=1
		fi


	    elif [[ $rep3 -eq 2 ]]
	    then
		fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
                listmod=$(echo $fline | sed 's/.*MO://; s/;COEF.*//')
		echo -e "\nThis is all of your Module:\n$listmod"
		echo -e "\nWhich Module do you want to select before selecting teaching methods?"
                read modname

	        echo -e "\nWhich Teaching Methods do you want to select?\n[TP / TD / CM / DE / CE]"
		read tmname


		echo -e "\nWhat do you want to modify in this Teaching Methods?"
                echo "Enter your choice"
                echo "1. The Teaching Methods"
                echo "2. The Coef of the Teaching Methods"
		echo "Exit"
		read repteach

		if [[ $repteach -eq 1 ]]	#Delete Teaching Methods
		then
		    if [[  $tmname = "TP" ]] || [[ $tmname = "tp" ]]
		    then
			fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
			list1=$(echo $fline | sed 's/.*;TP://; s/;.*//')
			list2=$(echo $fline | sed 's/.*;ETP://; s/;.*//')
			list3=$(echo $fline | sed 's/.*;COEFTP://; s/;.*//')
			
			V1=($list1)
			V2=($list2)
			V3=($list3)
			
			for i in "${!V1[@]}"; do
			    if [[ $i -eq 0 && $i -eq $ipos ]]
			    then
				newstringtm="$tmname:N"
				newstringtme="E$tmname:X"
				newstringtmcoef="COEF$tmname:X"
			    elif [[ $i -eq 0 && $i != $ipos ]]
			    then
				newstringtm="$tmname:${V1[i]}"
				newstringtme="E$tmname:${V2[i]}"
				newstringtmcoef="COEF$tmname:${V3[i]}"
			    elif [[ $i -eq $ipos ]]
			    then
				newstringtm="$newstringtm N"
				newstringtme="$newstringtme X"
				newstringtmcoef="$newstringtmcoef X"
			    else
				newstringtm="$newstringtm ${V1[i]}"
				newstringtme="$newstringtme ${V2[i]}"
				newstringtmcoef="$newstringtmcoef ${V3[i]}"
			    fi
			done
			stringtm="$tmname:$list1"
			stringtme="E$tmname:$list2"
			stringtmcoef="COEF$tmname:$list3"
			
			deltm=$(sed -e ''$fcline's/'"$stringtm"'/'"$newstringtm"'/' -e ''$fcline's/'"$stringtme"'/'"$newstringtme"'/' -e ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' semester_sheet.txt )
			cat /dev/null > $semestername
			echo -n "$deltm" >> $semestername
			
			rm -rf $semname/$uename/$modname/TP

		    elif [[ $tmname = "TD" ]] || [[ $tmname = "td" ]]
		    then
			fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
			list1=$(echo $fline | sed 's/.*;TD://; s/;.*//')
			list2=$(echo $fline | sed 's/.*;ETD://; s/;.*//')
			list3=$(echo $fline | sed 's/.*;COEFTD://; s/;.*//')

			V1=($list1)
			V2=($list2)
			V3=($list3)

			for i in "${!V1[@]}"; do
			    if [[ $i -eq 0 && $i -eq $ipos ]]
			    then
				newstringtm="$tmname:N"
				newstringtme="E$tmname:X"
				newstringtmcoef="COEF$tmname:X"
			    elif [[ $i -eq 0 && $i != $ipos ]]
			    then
				newstringtm="$tmname:${V1[i]}"
				newstringtme="E$tmname:${V2[i]}"
				newstringtmcoef="COEF$tmname:${V3[i]}"
			    elif [[ $i -eq $ipos ]]
			    then
				newstringtm="$newstringtm N"
				newstringtme="$newstringtme X"
				newstringtmcoef="$newstringtmcoef X"
			    else
				newstringtm="$newstringtm ${V1[i]}"
				newstringtme="$newstringtme ${V2[i]}"
				newstringtmcoef="$newstringtmcoef ${V3[i]}"
			    fi
			done
			stringtm="$tmname:$list1"
			stringtme="E$tmname:$list2"
			stringtmcoef="COEF$tmname:$list3"

			deltm=$(sed -e ''$fcline's/'"$stringtm"'/'"$newstringtm"'/' -e ''$fcline's/'"$stringtme"'/'"$newstringtme"'/' -e ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' semester_sheet.txt )
			cat /dev/null > $semestername
			echo -n "$deltm" >> $semestername
			
			rm -rf $semname/$uename/$modname/TD

                    elif [[ $tmname = "CM" ]] || [[ $tmname = "cm" ]]
                    then
			fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
			list1=$(echo $fline | sed 's/.*;CM://; s/;.*//')
			list2=$(echo $fline | sed 's/.*ECM://; s/;.*//')
			list3=$(echo $fline | sed 's/.*COEFCM://; s/;.*//')

			V1=($list1)
			V2=($list2)
			V3=($list3)

			for i in "${!V1[@]}"; do
			    if [[ $i -eq 0 && $i -eq $ipos ]]
			    then
				newstringtm="$tmname:N"
				newstringtme="E$tmname:X"
				newstringtmcoef="COEF$tmname:X"
			    elif [[ $i -eq 0 && $i != $ipos ]]
			    then
				newstringtm="$tmname:${V1[i]}"
				newstringtme="E$tmname:${V2[i]}"
				newstringtmcoef="COEF$tmname:${V3[i]}"
			    elif [[ $i -eq $ipos ]]
			    then
				newstringtm="$newstringtm N"
				newstringtme="$newstringtme X"
				newstringtmcoef="$newstringtmcoef X"
			    else
				newstringtm="$newstringtm ${V1[i]}"
				newstringtme="$newstringtme ${V2[i]}"
				newstringtmcoef="$newstringtmcoef ${V3[i]}"
			    fi
			done
			stringtm="$tmname:$list1"
			stringtme="E$tmname:$list2"
			stringtmcoef="COEF$tmname:$list3"

			deltm=$(sed -e ''$fcline's/'"$stringtm"'/'"$newstringtm"'/' -e ''$fcline's/'"$stringtme"'/'"$newstringtme"'/' -e ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' semester_sheet.txt )
			cat /dev/null > $semestername
			echo -n "$deltm" >> $semestername
			
			rm -rf $semname/$uename/$modname/CM

                    elif [[ $tmname = "DE" ]] || [[ $tmname = "de" ]]
                    then
			fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
			list1=$(echo $fline | sed 's/.*;DE://; s/;.*//')
			list2=$(echo $fline | sed 's/.*;EDE://; s/;.*//')
			list3=$(echo $fline | sed 's/.*;COEFDE://; s/;.*//')
			
			V1=($list1)
			V2=($list2)
			V3=($list3)
			
			for i in "${!V1[@]}"; do
			    if [[ $i -eq 0 && $i -eq $ipos ]]
			    then
				newstringtm="$tmname:N"
				newstringtme="E$tmname:X"
				newstringtmcoef="COEF$tmname:X"
			    elif [[ $i -eq 0 && $i != $ipos ]]
			    then
				newstringtm="$tmname:${V1[i]}"
				newstringtme="E$tmname:${V2[i]}"
				newstringtmcoef="COEF$tmname:${V3[i]}"
			    elif [[ $i -eq $ipos ]]
			    then
				newstringtm="$newstringtm N"
				newstringtme="$newstringtme X"
				newstringtmcoef="$newstringtmcoef X"
			    else
				newstringtm="$newstringtm ${V1[i]}"
				newstringtme="$newstringtme ${V2[i]}"
				newstringtmcoef="$newstringtmcoef ${V3[i]}"
			    fi
			done
			stringtm="$tmname:$list1"
			stringtme="E$tmname:$list2"
			stringtmcoef="COEF$tmname:$list3"

			deltm=$(sed -e ''$fcline's/'"$stringtm"'/'"$newstringtm"'/' -e ''$fcline's/'"$stringtme"'/'"$newstringtme"'/' -e ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' semester_sheet.txt )
			cat /dev/null > $semestername
			echo -n "$deltm" >> $semestername
			
			rm -rf $semname/$uename/$modname/DE

                    elif [[ $tmname = "CE" ]] || [[ $tmname = "ce" ]]
                    then
			fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
			
			list1=$(echo $fline | sed 's/.*;CE://; s/;.*//')
			list2=$(echo $fline | sed 's/.*;ECE://; s/;.*//')
			list3=$(echo $fline | sed 's/.*;COEFCE://; s/;.*//')
			
			V1=($list1)
			V2=($list2)
			V3=($list3)
			
			for i in "${!V1[@]}"; do
			    if [[ $i -eq 0 && $i -eq $ipos ]]
			    then
				newstringtm="$tmname:N"
				newstringtme="E$tmname:X"
				newstringtmcoef="COEF$tmname:X"
			    elif [[ $i -eq 0 && $i != $ipos ]]
			    then
				newstringtm="$tmname:${V1[i]}"
				newstringtme="E$tmname:${V2[i]}"
				newstringtmcoef="COEF$tmname:${V3[i]}"
			    elif [[ $i -eq $ipos ]]
			    then
				newstringtm="$newstringtm N"
				newstringtme="$newstringtme X"
				newstringtmcoef="$newstringtmcoef X"
			    else
				newstringtm="$newstringtm ${V1[i]}"
				newstringtme="$newstringtme ${V2[i]}"
				newstringtmcoef="$newstringtmcoef ${V3[i]}"
			    fi
			done
			stringtm="$tmname:$list1"
			stringtme="E$tmname:$list2"
			stringtmcoef="COEF$tmname:$list3"
			
			deltm=$(sed -e ''$fcline's/'"$stringtm"'/'"$newstringtm"'/' -e ''$fcline's/'"$stringtme"'/'"$newstringtme"'/' -e ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' semester_sheet.txt )
			cat /dev/null > $semestername
			echo -n "$deltm" >> $semestername
			
			rm -rf $semname/$uename/$modname/CE
			
		    else
			echo "Error option: Program Shutdown"
			ext=1
		    fi
                    
		elif [[ $repteach -eq 2 ]]	#Delete coef Teaching Methods
		then
                    if [[  $tmname = "TP" ]] || [[ $tmname = "tp" ]]
		    then
			fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
			list=$(echo $fline | sed 's/.*;COEFTP://; s/;.*//')
			
			V=($list)
			
			for i in "${!V[@]}"; do
                            if [[ $i -eq 0 && $i -eq $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:X"
                            elif [[ $i -eq 0 && $i != $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:${V[i]}"
                            elif [[ $i -eq $ipos ]]
                            then
				newstringtmcoef="$newstringtmcoef X"
                            else
				newstringtmcoef="$newstringtmcoef ${V[i]}"
                            fi
			done
			
			stringtmcoef="COEF$tmname:$list"
			
			deltmcoef=$(sed ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' $semestername)
			cat /dev/null > $semestername
			echo -n "$deltmcoef" >> $semestername
			
		    elif [[ $tmname = "TD" ]] || [[ $tmname = "td" ]]
		    then
			fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
			list=$(echo $fline | sed 's/.*;COEFTD://; s/;.*//')
			
			V=($list)
			
			for i in "${!V[@]}"; do
                            if [[ $i -eq 0 && $i -eq $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:X"
                            elif [[ $i -eq 0 && $i != $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:${V[i]}"
                            elif [[ $i -eq $ipos ]]
                            then
				newstringtmcoef="$newstringtmcoef X"
                            else
				newstringtmcoef="$newstringtmcoef ${V[i]}"
                            fi
			done
			
			stringtmcoef="COEF$tmname:$list"
			
			deltmcoef=$(sed ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' $semestername)
			cat /dev/null > $semestername
			echo -n "$deltmcoef" >> $semestername
			
                    elif [[ $tmname = "CM" ]] || [[ $tmname = "cm" ]]
                    then
			fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
			list=$(echo $fline | sed 's/.*;COEFCM://; s/;.*//')
			
			V=($list)
			
			for i in "${!V[@]}"; do
                            if [[ $i -eq 0 && $i -eq $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:X"
                            elif [[ $i -eq 0 && $i != $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:${V[i]}"
                            elif [[ $i -eq $ipos ]]
                            then
				newstringtmcoef="$newstringtmcoef X"
                            else
				newstringtmcoef="$newstringtmcoef ${V[i]}"
                            fi
			done
			
			stringtmcoef="COEF$tmname:$list"
			
			deltmcoef=$(sed ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' $semestername)
			cat /dev/null > $semestername
			echo -n "$deltmcoef" >> $semestername
			
                    elif [[ $tmname = "DE" ]] || [[ $tmname = "de" ]]
                    then
			fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
			list=$(echo $fline | sed 's/.*;COEFDE://; s/;.*//')
			
			V=($list)
			
			for i in "${!V[@]}"; do
                            if [[ $i -eq 0 && $i -eq $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:X"
                            elif [[ $i -eq 0 && $i != $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:${V[i]}"
                            elif [[ $i -eq $ipos ]]
                            then
				newstringtmcoef="$newstringtmcoef X"
                            else
				newstringtmcoef="$newstringtmcoef ${V[i]}"
                            fi
			done
			
			stringtmcoef="COEF$tmname:$list"
			
			deltmcoef=$(sed ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' $semestername)
			cat /dev/null > $semestername
			echo -n "$deltmcoef" >> $semestername
			
                    elif [[ $tmname = "CE" ]] || [[ $tmname = "ce" ]]
                    then
			fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' $semestername)
			list=$(echo $fline | sed 's/.*;COEFCE://; s/;.*//')
			
			V=($list)
			
			for i in "${!V[@]}"; do
                            if [[ $i -eq 0 && $i -eq $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:X"
                            elif [[ $i -eq 0 && $i != $ipos ]]
                            then
				newstringtmcoef="COEF$tmname:${V[i]}"
                            elif [[ $i -eq $ipos ]]
                            then
				newstringtmcoef="$newstringtmcoef X"
                            else
				newstringtmcoef="$newstringtmcoef ${V[i]}"
                            fi
			done
			
			stringtmcoef="COEF$tmname:$list"
			
			deltmcoef=$(sed ''$fcline's/'"$stringtmcoef"'/'"$newstringtmcoef"'/' $semestername)
			cat /dev/null > $semestername
			echo -n "$deltmcoef" >> $semestername
		    else
			echo "Error option: Program Shutdown"
			ext=1
		    fi
		    
		else
		    echo "Error option: Program Shutdown"
		    ext=1
		fi
		
	    else
		echo "Error option: Program Shutdown"
        	ext=1
	    fi

    	else
	    echo "Error option: Program Shutdown"
            ext=1
        fi

    else
    	echo "Error option: Program Shutdown"
    	ext=1
    fi   

else
    echo "Exit: Program Shutdown"
    ext=1
fi
done
