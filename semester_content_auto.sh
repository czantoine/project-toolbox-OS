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
	CTP=(`cut -d: -f 9 "$filein"`)
	TD=(`cut -d: -f 10 "$filein"`)
	CTD=(`cut -d: -f 11 "$filein"`)
	CM=(`cut -d: -f 12 "$filein"`)
	CCM=(`cut -d: -f 13 "$filein"`)
	DE=(`cut -d: -f 14 "$filein"`)
	CDE=(`cut -d: -f 15 "$filein"`)
	CE=(`cut -d: -f 16 "$filein"`)
	CCE=(`cut -d: -f 17 "$filein"`)

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
			NOW=$(date +"%d-%m-%Y-%r")
			username_group=$(id -Gn ${V[i]})
			echo "################################" | sudo tee -a semester.conf
			echo "Whrite at : $NOW" | sudo tee -a semester.conf
			x=0
			for se in ${SE[*]}
			do
				sudo mkdir -m 700 ${SE[x]}
				sudo chown ${V[i]}:${V[i]}  ${SE[x]}
    				echo ""${SE[x]}" : $username_group" | sudo tee -a semester.conf

				for ue in ${UE[*]}
                        	do
                                	sudo mkdir -m 700 ${SE[x]}/${UE[x]}
                                	sudo chown ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}
                        	done
				echo -n "UE:"${UE[x]} "" | sudo tee -a semester_${SE[x]}.info

				for coefue in ${COEFUE[*]}
				do
					echo ""
				done
				echo -n ";COEFUE:"${COEFUE[x]} "" | sudo tee -a semester_${SE[x]}.info

				for mo in ${MO[*]}
                                do
                                	echo ""
                                done

				echo -n ";MO:" | sudo tee -a semester_${SE[x]}.info
				list_mo=$(echo ${MO[x]} | tr "," "\n")
				cmpt_mo=$(echo $list_mo | wc -w)
				M=($list_mo)

				for m in "${!M[@]}"; do
    					printf 'M[%s] = %s\n' "$m" "${M[m]}" > /dev/null
				done

				for ((m = 0 ; m <= $cmpt_mo ; m++)); do
					sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[m]}
					sudo chown ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}/${M[m]}
					echo -n ""${M[m]} "" | sudo tee -a semester_${SE[x]}.info
				done

				for coef in ${COEF[*]}
                                do
                                        echo ""
                                done


				echo -n ";COEF:" | sudo tee -a semester_${SE[x]}.info
				listc_mo=$(echo ${COEF[x]} | tr "," "\n")
                                MC=($listc_mo)

                                for mc in "${!MC[@]}"; do
                                        printf 'MC[%s] = %s\n' "$mc" "${MC[mc]}" > /dev/null
                                done

                                for ((mc = 0 ; mc <= $cmpt_mo ; mc++)); do
                                	 echo -n ""${MC[mc]} "" | sudo tee -a semester_${SE[x]}.info
                                done

				for teach in ${TEACH[*]}
                                do
                                        echo ""
                                done
                                echo -n ";TEACH:"${TEACH[x]} "" | sudo tee -a semester_${SE[x]}.info

				for emailteach in ${EMAILTEACH[*]}
                                do
                                        echo ""
                                done
                                echo -n ";EMAILTEACH:"${EMAILTEACH[x]} "" | sudo tee -a semester_${SE[x]}.info

				############ TP ############

				echo -n ";TP:" | sudo tee -a semester_${SE[x]}.info
                                list_tp=$(echo $TP | tr "," "\n")
                                T=($list_tp)

                                for t in "${!T[@]}"; do
                                        printf 'T[%s] = %s\n' "$t" "${T[t]}" > /dev/null
                                done

                                for ((t = 0 ; t < $cmpt_mo ; t++)); do
					if [[ ${T[t]} = TP ]]
					then
                                        	sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[x]}/TP
                                        	sudo chown ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}/${M[x]}/TP
                                        	echo -n "Y " | sudo tee -a semester_${SE[x]}.info
					else
						echo -n "N " | sudo tee -a semester_${SE[x]}.info
					fi
                                done

				echo -n ";ETP: " | sudo tee -a semester_${SE[x]}.info
				echo -n ";COEFTP:" | sudo tee -a semester_${SE[x]}.info
                                listc_tp=$(echo $CTP | tr "," "\n")
                                TPC=($listc_tp)

                                for tpc in "${!TPC[@]}"; do
                        	        printf 'TPC[%s] = %s\n' "$tpc" "${TPC[tpc]}" > /dev/null
                                done

                                for ((tpc = 0 ; tpc <= $cmpt_mo ; tpc++)); do
					if [[ ${TPC[tpc]} = X ]]
					then
						echo -n "X " | sudo tee -a semester_${SE[x]}.info
					else
                                        echo -n ""${TPC[tpc]} "" | sudo tee -a semester_${SE[x]}.info
                                	fi
				done

				################ TD ################

                                echo -n ";TD:" | sudo tee -a semester_${SE[x]}.info
                                list_td=$(echo $TD | tr "," "\n")
                                TT=($list_td)

                                for tt in "${!TT[@]}"; do
                                        printf 'TT[%s] = %s\n' "$tt" "${TT[tt]}" > /dev/null
                                done

                                for ((tt = 0 ; tt < $cmpt_mo ; tt++)); do
                                        if [[ ${TT[tt]} = TD ]]
                                        then
                                                sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[x]}/TD
                                                sudo chown ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}/${M[x]}/TD
                                                echo -n "Y " | sudo tee -a semester_${SE[x]}.info
                                        else
                                                echo -n "N " | sudo tee -a semester_${SE[x]}.info
                                        fi
                                done

                                echo -n ";ETD: " | sudo tee -a semester_${SE[x]}.info
                                echo -n ";COEFTD:" | sudo tee -a semester_${SE[x]}.info
                                listc_td=$(echo $CTD | tr "," "\n")
                                TTDC=($listc_td)

                                for ttdc in "${!TTDC[@]}"; do
                                        printf 'TTDC[%s] = %s\n' "$ttdc" "${TTDC[ttdc]}" > /dev/null
                                done

                                for ((ttdc = 0 ; ttdc <= $cmpt_mo ; ttdc++)); do
					if [[ ${TTDC[ttdc]} = X ]]
                                        then
                                                echo -n "X " | sudo tee -a semester_${SE[x]}.info
                                        else
                                        echo -n ""${TTDC[ttdc]} "" | sudo tee -a semester_${SE[x]}.info
                                        fi
                                done

				########### CM ############

                                echo -n ";CM:" | sudo tee -a semester_${SE[x]}.info
                                list_cm=$(echo $CM | tr "," "\n")
                                C=($list_cm)

                                for c in "${!C[@]}"; do
                                        printf 'C[%s] = %s\n' "$c" "${C[c]}" > /dev/null
                                done

                                for ((c = 0 ; c < $cmpt_mo ; c++)); do
                                        if [[ ${C[c]} = CM ]]
                                        then
                                                sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[x]}/CM
                                                sudo chown ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}/${M[x]}/CM
                                                echo -n "Y " | sudo tee -a semester_${SE[x]}.info
                                        else
                                                echo -n "N " | sudo tee -a semester_${SE[x]}.info
                                        fi
                                done

                                echo -n ";ECM: " | sudo tee -a semester_${SE[x]}.info
                                echo -n ";COEFCM:" | sudo tee -a semester_${SE[x]}.info
                                listc_cm=$(echo $CCM | tr "," "\n")
                                CMC=($listc_cm)

                                for cmc in "${!CMC[@]}"; do
                                        printf 'CMC[%s] = %s\n' "$cmc" "${CMC[cmc]}" > /dev/null
                                done

                                for ((cmc = 0 ; cmc <= $cmpt_mo ; cmc++)); do
                                        if [[ ${CMC[cmc]} = X ]]
                                        then
                                                echo -n "X " | sudo tee -a semester_${SE[x]}.info
                                        else
                                        echo -n ""${CMC[cmc]} "" | sudo tee -a semester_${SE[x]}.info
                                        fi
                                done

				############## DE ###############

				echo -n ";DE:" | sudo tee -a semester_${SE[x]}.info
                                list_de=$(echo $DE | tr "," "\n")
                                D=($list_de)

                                for d in "${!D[@]}"; do
                                        printf 'D[%s] = %s\n' "$d" "${D[d]}" > /dev/null
                                done

                                for ((d = 0 ; d < $cmpt_mo ; d++)); do
                                        if [[ ${D[d]} = DE ]]
                                        then
                                                sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[x]}/DE
                                                sudo chown ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}/${M[x]}/DE
                                                echo -n "Y " | sudo tee -a semester_${SE[x]}.info
                                        else
                                                echo -n "N " | sudo tee -a semester_${SE[x]}.info
                                        fi
                                done

                                echo -n ";EDE: " | sudo tee -a semester_${SE[x]}.info
                                echo -n ";COEFDE:" | sudo tee -a semester_${SE[x]}.info
                                listc_de=$(echo $CDE | tr "," "\n")
                                CDE=($listc_de)

                                for cde in "${!CDE[@]}"; do
                                        printf 'CDE[%s] = %s\n' "$cde" "${CDE[cde]}" > /dev/null
                                done

                                for ((cde = 0 ; cde <= $cmpt_mo ; cde++)); do
                                        if [[ ${CDE[cde]} = X ]]
                                        then
                                                echo -n "X " | sudo tee -a semester_${SE[x]}.info
                                        else
                                        	echo -n ""${CDE[cde]} "" | sudo tee -a semester_${SE[x]}.info
                                        fi
                                done

				############ CE ###########

				echo -n ";CE:" | sudo tee -a semester_${SE[x]}.info
                                list_ce=$(echo $CE | tr "," "\n")
                                CC=($list_ce)

                                for cc in "${!CC[@]}"; do
                                        printf 'CC[%s] = %s\n' "$cc" "${CC[cc]}" > /dev/null
                                done

                                for ((cc = 0 ; cc < $cmpt_mo ; cc++)); do
                                        if [[ ${CC[cc]} = CE ]]
                                        then
                                                sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[x]}/CE
                                                sudo chown ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}/${M[x]}/CE
                                                echo -n "Y " | sudo tee -a semester_${SE[x]}.info
                                        else
                                                echo -n "N " | sudo tee -a semester_${SE[x]}.info
                                        fi
                                done

                                echo -n ";ECE: " | sudo tee -a semester_${SE[x]}.info
                                echo -n ";COEFCE:" | sudo tee -a semester_${SE[x]}.info
                                listc_ce=$(echo $CCE | tr "," "\n")
                                CCCE=($listc_ce)

                                for ccce in "${!CCCE[@]}"; do
                                        printf 'CCCE[%s] = %s\n' "$ccce" "${CCCE[ccce]}" > /dev/null
                                done

                                for ((ccce = 0 ; ccce <= $cmpt_mo ; ccce++)); do
                                        if [[ ${CCCE[ccce]} = X ]]
                                        then
                                                echo -n "X " | sudo tee -a semester_${SE[x]}.info
                                        else
                                        	echo -n ""${CCCE[ccce]} "" | sudo tee -a semester_${SE[x]}.info
                                        fi
                                done

				echo -n ";FINISH" | sudo tee -a semester_${SE[x]}.info


				x=$x+1
			done


		done

    	else
        	echo "group does not exist"
		echo "error"
		exit 1
    	fi

fi


