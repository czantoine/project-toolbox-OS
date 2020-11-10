#!/bin/bash

# S1:math:3:geo,reel:3,4:teller:ac11f@free.fr:TP,TP:3,4:TD,X:3,X:CM,CM:4,3:X,DE:X,3:CE,CE:3,3
# Semester:UE:COEFUE:MO:COEF:TEACH:EMAILTEACH:TP:ETP:TD:ETD:CM:ECM:DE:EDE:CE:ECE

filein="semester.csv"
IFS=$'\n'

if [ ! -f "$filein" ]
then
	echo "Cannot find file $filein"
else

 	SE=(`cut -d: -f 1 "$filein"`)
  	UE=(`cut -d: -f 2 "$filein"`)
  	COEFUE=(`cut -d: -f 3 "$filein"`)
	MO=(`cut -d: -f 4 "$filein"`)
 	COEF=(`cut -d: -f 5 "$filein"`)
	TEACH=(`cut -d: -f 6 "$filein"`)
	EMAILTEACH=(`cut -d: -f 7 "$filein"`)
	TP=(`cut -d: -f 8 "$filein"`)
	ETP=(`cut -d: -f 9 "$filein"`)
	TD=(`cut -d: -f 10 "$filein"`)
	ETD=(`cut -d: -f 11 "$filein"`)
	CM=(`cut -d: -f 12 "$filein"`)
	ECM=(`cut -d: -f 13 "$filein"`)
	DE=(`cut -d: -f 14 "$filein"`)
	EDE=(`cut -d: -f 15 "$filein"`)
	CE=(`cut -d: -f 16 "$filein"`)
	ECE=(`cut -d: -f 17 "$filein"`)

	echo -e "\nWhat is the group you want create a new semester ?"
	read ggg

	if grep -q $ggg /etc/group
    	then
		group_member=$(grep "$ggg" /etc/group)
		clear_group=$(echo $group_member | sed 's/.*://')
		list=$(echo $clear_group | tr "," "\n")
        	cmpt_list=$(echo $list | wc -w)
		V=($list)
		for i in "${!V[@]}"; do
   			printf 'V[%s] = %s\n' "$i" "${V[i]}" #> /dev/null
		done

		for ((i = 0 ; i < $cmpt_list ; i++)); do
			cd /home/${V[i]}/
			x=0
			for se in ${SE[*]}
			do
				sudo mkdir -m 700 ${SE[x]}
    				x=$x+1
			done
		done

    	else
        	echo "group does not exist"
		echo "error"
		exit 1
    	fi

fi


