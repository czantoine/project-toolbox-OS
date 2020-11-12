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
		listt=$(echo $clear_group | tr "," "\n")
        	cmpt_listt=$(echo $listt | wc -w)
		VV=($listt)
		for i in "${!VV[@]}"; do
   			printf 'VV[%s] = %s\n' "$i" "${VV[i]}" #> /dev/null
		done
		for ((i = 0 ; i < $cmpt_listt ; i++)); do
			ss=$(groups ${VV[i]})
			if [[ $ss == *"student"* ]]; then
  			var3="$var3${VV[i]},"
			fi
		done

		clear_groupp=$(echo $var3 | tr "," "\n")
		cmpt_list=$(echo $clear_groupp | wc -w)
		V=($clear_groupp)
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

				for ((m = 0 ; m <= $cmpt_mo ; m++)); do
                                        sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[m]}/TP
                               		sudo chown ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}/${M[m]}/TP
					sudo rmdir ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}/TP
					sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[m]}/TD
                                        sudo chown ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}/${M[m]}/TD
                                        sudo rmdir ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}/TD
					sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[m]}/CM
                                        sudo chown ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}/${M[m]}/CM
                                        sudo rmdir ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}/CM
					sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[m]}/DE
                                        sudo chown ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}/${M[m]}/DE
                                        sudo rmdir ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}/DE
					sudo mkdir -m 700 ${SE[x]}/${UE[x]}/${M[m]}/CE
                                        sudo chown ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}/${M[m]}/CE
                                        sudo rmdir ${V[i]}:${V[i]} ${SE[x]}/${UE[x]}/CE
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

				for tp in ${TP[*]}
                                do
                                        echo ""
                                done

				echo -n ";TP:" | sudo tee -a semester_${SE[x]}.info
                                list_tp=$(echo ${TP[x]} | tr "," "\n")
                                T=($list_tp)

                                for t in "${!T[@]}"; do
                                        printf 'T[%s] = %s\n' "$t" "${T[t]}" > /dev/null
                                done

                                for ((t = 0 ; t < $cmpt_mo ; t++)); do
					if [[ ${T[t]} = TP ]]
					then
                                        	echo -n "Y " | sudo tee -a semester_${SE[x]}.info
					else
						echo -n "N " | sudo tee -a semester_${SE[x]}.info						
					fi
                                done

				for coeftp in ${CTP[*]}
                                do
                                        echo ""
                                done

				echo -n ";ETP: " | sudo tee -a semester_${SE[x]}.info
				echo -n ";COEFTP:" | sudo tee -a semester_${SE[x]}.info
                                listc_tp=$(echo ${CTP[x]} | tr "," "\n")
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

				for td in ${TD[*]}
                                do
                                        echo ""
                                done

                                echo -n ";TD:" | sudo tee -a semester_${SE[x]}.info
                                list_td=$(echo $TD | tr "," "\n")
                                TT=($list_td)

                                for tt in "${!TT[@]}"; do
                                        printf 'TT[%s] = %s\n' "$tt" "${TT[tt]}" > /dev/null
                                done

                                for ((tt = 0 ; tt < $cmpt_mo ; tt++)); do
                                        if [[ ${TT[tt]} = TD ]]
                                        then
                                                echo -n "Y " | sudo tee -a semester_${SE[x]}.info
                                        else
                                                echo -n "N " | sudo tee -a semester_${SE[x]}.info
					fi
                                done

				for coeftd in ${CTD[*]}
                                do
                                        echo ""
                                done


                                echo -n ";ETD: " | sudo tee -a semester_${SE[x]}.info
                                echo -n ";COEFTD:" | sudo tee -a semester_${SE[x]}.info
                                listc_td=$(echo ${CTD[x]} | tr "," "\n")
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

				for cm in ${CM[*]}
                                do
                                        echo ""
                                done


                                echo -n ";CM:" | sudo tee -a semester_${SE[x]}.info
                                list_cm=$(echo $CM | tr "," "\n")
                                C=($list_cm)

                                for c in "${!C[@]}"; do
                                        printf 'C[%s] = %s\n' "$c" "${C[c]}" > /dev/null
                                done

                                for ((c = 0 ; c < $cmpt_mo ; c++)); do
                                        if [[ ${C[c]} = CM ]]
                                        then
                                                echo -n "Y " | sudo tee -a semester_${SE[x]}.info
                                        else
                                                echo -n "N " | sudo tee -a semester_${SE[x]}.info
					fi
                                done

				for coefcm in ${CCM[*]}
                                do
                                        echo ""
                                done

                                echo -n ";ECM: " | sudo tee -a semester_${SE[x]}.info
                                echo -n ";COEFCM:" | sudo tee -a semester_${SE[x]}.info
                                listc_cm=$(echo ${CCM[x]} | tr "," "\n")
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

				############ DE ########
				
				for de in ${DE[*]}
                                do
                                        echo ""
                                done

                                echo -n ";DE:" | sudo tee -a semester_${SE[x]}.info
                                list_de=$(echo $DE | tr "," "\n")
                                TTT=($list_de)

                                for ttt in "${!TTT[@]}"; do
                                        printf 'TTT[%s] = %s\n' "$ttt" "${TTT[ttt]}" > /dev/null
                                done

                                for ((ttt = 0 ; ttt < $cmpt_mo ; ttt++)); do
                                        if [[ ${TTT[ttt]} = DE ]]
                                        then
                                                echo -n "Y " | sudo tee -a semester_${SE[x]}.info
                                        else
                                                echo -n "N " | sudo tee -a semester_${SE[x]}.info
					fi
                                done

				for coefde in ${CDE[*]}
                                do
                                        echo ""
                                done


                                echo -n ";EDE: " | sudo tee -a semester_${SE[x]}.info
                                echo -n ";COEFDE:" | sudo tee -a semester_${SE[x]}.info
                                listc_de=$(echo ${CDE[x]} | tr "," "\n")
                                TTDCDE=($listc_de)

                                for ttdcde in "${!TTDCDE[@]}"; do
                                        printf 'TTDCDE[%s] = %s\n' "$ttdcde" "${TTDCDE[ttdcde]}" > /dev/null
                                done

                                for ((ttdcde = 0 ; ttdcde <= $cmpt_mo ; ttdcde++)); do
					if [[ ${TTDCDE[ttdcde]} = X ]]
                                        then
                                                echo -n "X " | sudo tee -a semester_${SE[x]}.info
                                        else
                           	             echo -n ""${TTDCDE[ttdcde]} "" | sudo tee -a semester_${SE[x]}.info
                                        fi
                                done


				############ CE ########


				for ce in ${CE[*]}
                                do
                                        echo ""
                                done

                                echo -n ";CE:" | sudo tee -a semester_${SE[x]}.info
                                list_ce=$(echo $CE | tr "," "\n")
                                TT=($list_ce)

                                for ttyy in "${!TTYY[@]}"; do
                                        printf 'TTYY[%s] = %s\n' "$ttyy" "${TTYY[ttyy]}" > /dev/null
                                done

                                for ((ttyy = 0 ; ttyy < $cmpt_mo ; ttyy++)); do
                                        if [[ ${TTYY[ttyy]} = CE ]]
                                        then
                                                echo -n "Y " | sudo tee -a semester_${SE[x]}.info
                                        else
                                                echo -n "N " | sudo tee -a semester_${SE[x]}.info
					fi
                                done

				for coeftdce in ${CCE[*]}
                                do
                                        echo ""
                                done


                                echo -n ";ECE: " | sudo tee -a semester_${SE[x]}.info
                                echo -n ";COEFCE:" | sudo tee -a semester_${SE[x]}.info
                                listc_ce=$(echo ${CCE[x]} | tr "," "\n")
                                TTDCCE=($listc_ce)

                                for ttdcce in "${!TTDCCE[@]}"; do
                                        printf 'TTDCCE[%s] = %s\n' "$ttdcce" "${TTDCCE[ttdcce]}" > /dev/null
                                done

                                for ((ttdcce = 0 ; ttdcce <= $cmpt_mo ; ttdcce++)); do
					if [[ ${TTDCCE[ttdcce]} = X ]]
                                        then
                                                echo -n "X " | sudo tee -a semester_${SE[x]}.info
                                        else
                           	             echo -n ""${TTDCCE[ttdcce]} "" | sudo tee -a semester_${SE[x]}.info
                                        fi
                                done


				echo -n ";FINISH" | sudo tee -a semester_${SE[x]}.info

				echo -e "\n" | sudo tee -a semester_${SE[x]}.info

				x=$x+1
			done


		done

    	else
        	echo "group does not exist"
		echo "error"
		exit 1
    	fi

fi


