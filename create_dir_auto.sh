#!/bin/bash

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
	CTP=(`cut -d: -f 9 "$filein"`)
	TD=(`cut -d: -f 10 "$filein"`)
	CTD=(`cut -d: -f 11 "$filein"`)
	CM=(`cut -d: -f 12 "$filein"`)
	CCM=(`cut -d: -f 13 "$filein"`)
	DE=(`cut -d: -f 14 "$filein"`)
	CDE=(`cut -d: -f 15 "$filein"`)
	CE=(`cut -d: -f 16 "$filein"`)
	CCE=(`cut -d: -f 17 "$filein"`)

	echo -e "\n What is the classe group you want add ?"
	read ggg

	if grep -q $ggg /etc/group
	then
		x=0
		for se in ${TEACH[*]}
		do
			cd /home/${TEACH[x]}/
			for se in ${SE[*]}
                	do
                		sudo mkdir -m 700 ${SE[x]}
                        	sudo chown ${TEACH[x]}:${TEACH[x]} ${SE[x]}

				for ue in ${UE[*]}
                        	do
                                	sudo mkdir -m 700 ${SE[x]}/${UE[x]}
                                	sudo chown ${TEACH[x]}:${TEACH[x]} ${SE[x]}/${UE[x]}
                        	done

				list_mo=$(echo ${MO[x]} | tr "," "\n")
				cmpt_mo=$(echo $list_mo | wc -w)
				M=($list_mo)

				for m in "${!M[@]}"; do
    					printf 'M[%s] = %s\n' "$m" "${M[m]}" > /dev/null
				done

				for ((m = 0 ; m <= $cmpt_mo ; m++)); do
					pwd=$(pwd;sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[m]})
					sudo chown ${TEACH[x]}:${TEACH[x]} ${SE[x]}/${UE[x]}/${M[m]}

					sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[m]}/TP
                                        sudo chown ${TEACH[x]}:${TEACH[x]} ${SE[x]}/${UE[x]}/${M[m]}/TP
					sudo rmdir ${TEACH[x]}:${TEACH[x]} ${SE[x]}/${UE[x]}/TP

					sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[m]}/TD
                                        sudo chown ${TEACH[x]}:${TEACH[x]} ${SE[x]}/${UE[x]}/${M[m]}/TD
                                        sudo rmdir ${TEACH[x]}:${TEACH[x]} ${SE[x]}/${UE[x]}/TD

					sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[m]}/CM
                                        sudo chown ${TEACH[x]}:${TEACH[x]} ${SE[x]}/${UE[x]}/${M[m]}/CM
                                        sudo rmdir ${TEACH[x]}:${TEACH[x]} ${SE[x]}/${UE[x]}/CM

					sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[m]}/DE
                                        sudo chown ${TEACH[x]}:${TEACH[x]} ${SE[x]}/${UE[x]}/${M[m]}/DE
                                        sudo rmdir ${TEACH[x]}:${TEACH[x]} ${SE[x]}/${UE[x]}/DE

					sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[m]}/CE
                                        sudo chown ${TEACH[x]}:${TEACH[x]} ${SE[x]}/${UE[x]}/${M[m]}/CE
                                        sudo rmdir ${TEACH[x]}:${TEACH[x]} ${SE[x]}/${UE[x]}/CE

				done

                	done
		x=$x+1
		done
	fi

fi
