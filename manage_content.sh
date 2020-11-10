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

echo -e "\nWhat do you want to do ? Insert ADD or MODIFY : "
read adel

if [[ $adel = add ]] || [[ $adel = ADD ]]
then
    	echo -e "\nWhat do you want to add ?"
    	echo "Enter your choice"
   		echo "1. UE"
   		echo "2. MO"
		echo "3. TD"
		echo "4. TP"
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
        	echo -e "\nWhich UE do you want to add a Module ?"
		first_word=$(grep -Eo '^[^ ]+' semester_sheet.txt)
		echo -e "\nThis is what you have :\n$first_word"
		echo -e "\nwhich one do you want to add ? "
		read add
		line_number=$(grep -n ''$add'' semester_sheet.txt | sed 's/^\([0-9]\+\):.*$/\1/')
		echo -e "\nWhich name of module you want add ?"
		read name
		pos_number=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;COEF:')
		pos_letter=$(echo "$pos_number" | sed  's/: ;COEF.*//')
		aa=$(sed -E "${line_number}s/(.{$pos_letter})/& ${name}/" semester_sheet.txt)
		cat /dev/null > semester_sheet.txt
		echo "$aa" >> semester_sheet.txt

		echo -e "\nWhat is coef ? "
                read addcoef
		pos_number_coef=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;TEACH:')
                pos_letter_coef=$(echo "$pos_number_coef" | sed  's/: ;TEACH.*//')
		co=$(sed -E "${line_number}s/(.{$pos_letter_coef})/&, ${addcoef}/" semester_sheet.txt)
		cat /dev/null > semester_sheet.txt
                echo "$co" >> semester_sheet.txt

		pos_number_tp=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;ETP:')
        pos_letter_tp=$(echo "$pos_number_tp" | sed  's/: ;ETP.*//')
		echo "Do you want add TP ? TAP Y or N"
		read rep
		if [[ $rep =~ ^[Yy]$ ]]
		then
			Yes=Y
			etp=$(sed -E "${line_number}s/(.{$pos_letter_tp})/& ${Yes}/" semester_sheet.txt)
			cat /dev/null > semester_sheet.txt
	        echo "$etp" >> semester_sheet.txt

			echo -e "\nEnter coef  : "
			read rep_coef
			pos_number_coefetp=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;TD:')
			pos_letter_coef_tp=$(echo "$pos_number_coefetp" | sed  's/: ;TD.*//')
			coef_tp=$(sed -E "${line_number}s/(.{$pos_letter_coef_tp})/& ${rep_coef}/" semester_sheet.txt)
			cat /dev/null > semester_sheet.txt
			echo "$coef_tp" >> semester_sheet.txt

		else
			No=N
                        etp=$(sed -E "${line_number}s/(.{$pos_letter_tp})/& ${No}/" semester_sheet.txt)
                        cat /dev/null > semester_sheet.txt
                        echo "$etp" >> semester_sheet.txt

			rep_coef=N
                        pos_number_coefetp=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;TD:')
                        pos_letter_coef_tp=$(echo "$pos_number_coefetp" | sed  's/: ;TD.*//')
                        coef_tp=$(sed -E "${line_number}s/(.{$pos_letter_coef_tp})/& ${rep_coef}/" semester_sheet.txt)
                        cat /dev/null > semester_sheet.txt
                        echo "$coef_tp" >> semester_sheet.txt
		fi


		pos_number_td=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;ETD:')
        pos_letter_td=$(echo "$pos_number_td" | sed  's/: ;ETD.*//')
		echo "Do you want add TD ? TAP Y or N"
		read rep_td
		if [[ $rep_td =~ ^[Yy]$ ]]
		then
			Yes_td=Y
			etd=$(sed -E "${line_number}s/(.{$pos_letter_td})/& ${Yes_td}/" semester_sheet.txt)
			cat /dev/null > semester_sheet.txt
	        echo "$etd" >> semester_sheet.txt

			echo -e "\nEnter coef  : "
			read rep_coef_td
			pos_number_coefetd=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;CM:')
			pos_letter_coef_td=$(echo "$pos_number_coefetd" | sed  's/: ;CM.*//')
			coef_td=$(sed -E "${line_number}s/(.{$pos_letter_coef_td})/& ${rep_coef_td}/" semester_sheet.txt)
			cat /dev/null > semester_sheet.txt
			echo "$coef_td" >> semester_sheet.txt

		else
			No_td=N
                        etd=$(sed -E "${line_number}s/(.{$pos_letter_td})/& ${No_td}/" semester_sheet.txt)
                        cat /dev/null > semester_sheet.txt
                        echo "$etd" >> semester_sheet.txt

			rep_coef_td=N
                        pos_number_coefetd=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;CM:')
                        pos_letter_coef_td=$(echo "$pos_number_coefetd" | sed  's/: ;CM.*//')
                        coef_td=$(sed -E "${line_number}s/(.{$pos_letter_coef_td})/& ${rep_coef_td}/" semester_sheet.txt)
                        cat /dev/null > semester_sheet.txt
                        echo "$coef_td" >> semester_sheet.txt
		fi

		pos_number_cm=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;ECM:')
        pos_letter_cm=$(echo "$pos_number_cm" | sed  's/: ;ECM.*//')
		echo "Do you want add CM ? TAP Y or N"
		read rep_cm
		if [[ $rep_cm =~ ^[Yy]$ ]]
		then
			Yes_cm=Y
			ecm=$(sed -E "${line_number}s/(.{$pos_letter_cm})/& ${Yes_cm}/" semester_sheet.txt)
			cat /dev/null > semester_sheet.txt
	        echo "$ecm" >> semester_sheet.txt

			echo -e "\nEnter coef  : "
			read rep_coef_cm
			pos_number_coefecm=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;DE:')
			pos_letter_coef_cm=$(echo "$pos_number_coefecm" | sed  's/: ;DE.*//')
			coef_cm=$(sed -E "${line_number}s/(.{$pos_letter_coef_cm})/& ${rep_coef_cm}/" semester_sheet.txt)
			cat /dev/null > semester_sheet.txt
			echo "$coef_cm" >> semester_sheet.txt

		else
			No_cm=N
                        ecm=$(sed -E "${line_number}s/(.{$pos_letter_cm})/& ${No_cm}/" semester_sheet.txt)
                        cat /dev/null > semester_sheet.txt
                        echo "$ecm" >> semester_sheet.txt

			rep_coef_cm=N
                        pos_number_coefecm=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;DE:')
                        pos_letter_coef_cm=$(echo "$pos_number_coefecm" | sed  's/: ;DE.*//')
                        coef_cm=$(sed -E "${line_number}s/(.{$pos_letter_coef_cm})/& ${rep_coef_cm}/" semester_sheet.txt)
                        cat /dev/null > semester_sheet.txt
                        echo "$coef_cm" >> semester_sheet.txt
		fi

		pos_number_de=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;EDE:')
        pos_letter_de=$(echo "$pos_number_de" | sed  's/: ;EDE.*//')
		echo "Do you want add DE ? TAP Y or N"
		read rep_de
		if [[ $rep_de =~ ^[Yy]$ ]]
		then
			Yes_de=Y
			ede=$(sed -E "${line_number}s/(.{$pos_letter_de})/& ${Yes_de}/" semester_sheet.txt)
			cat /dev/null > semester_sheet.txt
	        echo "$ede" >> semester_sheet.txt

			echo -e "\nEnter coef  : "
			read rep_coef_de
			pos_number_coefede=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;CE:')
			pos_letter_coef_de=$(echo "$pos_number_coefede" | sed  's/: ;CE.*//')
			coef_de=$(sed -E "${line_number}s/(.{$pos_letter_coef_de})/& ${rep_coef_de}/" semester_sheet.txt)
			cat /dev/null > semester_sheet.txt
			echo "$coef_de" >> semester_sheet.txt

		else
			No_de=N
                        ede=$(sed -E "${line_number}s/(.{$pos_letter_de})/& ${No_de}/" semester_sheet.txt)
                        cat /dev/null > semester_sheet.txt
                        echo "$ede" >> semester_sheet.txt

			rep_coef_de=N
                        pos_number_coefede=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;CE:')
                        pos_letter_coef_de=$(echo "$pos_number_coefede" | sed  's/: ;CE.*//')
                        coef_de=$(sed -E "${line_number}s/(.{$pos_letter_coef_de})/& ${rep_coef_de}/" semester_sheet.txt)
                        cat /dev/null > semester_sheet.txt
                        echo "$coef_de" >> semester_sheet.txt
		fi

		pos_number_ce=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;ECE:')
        pos_letter_ce=$(echo "$pos_number_ce" | sed  's/: ;ECE.*//')
		echo "Do you want add CE ? TAP Y or N"
		read rep_ce
		if [[ $rep_ce =~ ^[Yy]$ ]]
		then
			Yes_ce=Y
			ece=$(sed -E "${line_number}s/(.{$pos_letter_ce})/& ${Yes_ce}/" semester_sheet.txt)
			cat /dev/null > semester_sheet.txt
	        echo "$ece" >> semester_sheet.txt

			echo -e "\nEnter coef  : "
			read rep_coef_ce
			pos_number_coefece=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;FINISH')
			pos_letter_coef_ce=$(echo "$pos_number_coefece" | sed  's/: ;FINISH.*//')
			coef_ce=$(sed -E "${line_number}s/(.{$pos_letter_coef_ce})/& ${rep_coef_ce}/" semester_sheet.txt)
			cat /dev/null > semester_sheet.txt
			echo "$coef_ce" >> semester_sheet.txt

		else
			No_ce=N
                        ece=$(sed -E "${line_number}s/(.{$pos_letter_ce})/& ${No_ce}/" semester_sheet.txt)
                        cat /dev/null > semester_sheet.txt
                        echo "$ece" >> semester_sheet.txt

			rep_coef_ce=N
                        pos_number_coefece=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;FINISH')
                        pos_letter_coef_ce=$(echo "$pos_number_coefece" | sed  's/: ;FINISH.*//')
                        coef_ce=$(sed -E "${line_number}s/(.{$pos_letter_coef_ce})/& ${rep_coef_ce}/" semester_sheet.txt)
                        cat /dev/null > semester_sheet.txt
                        echo "$coef_ce" >> semester_sheet.txt
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
	echo -e "\nWhich Semester do you want to select?"
	read semname


	echo -e "\nWhat do you want to modify in this Semester?"
	echo "Enter your choice"
	echo "1. The Semester"

	echo "Exit"

	read repsem
	if [[ $repsem -eq 1 ]]
	then
	    #Modify Semester
	    echo "Modification Semester"
	else
	    echo "Error option: Program Shutdown"
            ext=1
	fi

    elif [[ $rep -eq 2 ]]
    then
	echo -e "\nWhich Semester do you want to modify something?"
        read semname

	echo -e "\nWhat do you want to modify in this Semester"
	echo "Enter your choice"
	echo "1. A UE"
	echo "2. A Module or a Teaching Methods"

	echo "Exit"

	read rep2
	if [[ $rep2 -eq 1 ]]
	then
	    echo -e "\nWhich UE do you want to select?"
	    read uename


	    echo -e "\nWhat do you want to modify in this UE?"
	    echo "Enter your choice"
	    echo "1. The UE"
	    echo "2. The Coef of the UE"

	    echo "Exit"

	   read repue
	   if [[ $repue -eq 1 ]]	#Modify UE
           then

		fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' semester_sheet.txt)
		list=$(echo $fline | sed 's/.*UE://; s/;COEFUE.*//')


		echo -e "\nInsert the new name of the UE?"
		read newuename

		modue=$(sed 's/'$unname'/'$newuename'/' semester.txt)
		cat /dev/null > semester_content.txt
		echo -n "$modue" >> semester_content.txt

           elif [[ $repue -eq 2 ]]	#Modify coef UE
           then

		echo "You cannot modify the coef af the UE!"
           else
               echo "Error option: Program Shutdown"
               ext=1
           fi

	elif [[ $rep2 -eq 2 ]]
	then
	    echo -e "\nWhich UE do you want to modify something?"
            read uename

	    echo -e "\nWhat do you want to modify in this UE?"
	    echo "Enter your choice"
	    echo "1. A Module"
	    echo "2. A Teaching Methods"

	    echo "Exit"

	    read rep3
	    if [[ $rep3 -eq 1 ]]
	    then
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

		    fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' semester_sheet.txt)
                    list=$(echo $fline | sed 's/.*MO://; s/;COEF.*//')

		    V=($list)

                    echo -e "\nInsert the new name of the Module?"
                    read newmodname

                    modmod=$(sed 's/'$modname'/'$newmodname'/' semester_sheet.txt)
                    cat /dev/null > semester_sheet.txt
                    echo -n "$modmod" >> semester_sheet.txt


		elif [[ $repmod -eq 2 ]]	#Modify coef Module
		then

		    echo "\nYou cannot modify the coef of the module!"

		else
		    echo "Error option: Program Shutdown"
		    ext=1
		fi


	    elif [[ $rep3 -eq 2 ]]
	    then
		echo -e "\nWhich Module do you want to select before selecting teaching methods?"
                read modname


	        echo -e "\nWhich Teaching Methods do you want to select?"
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

                    echo "You cannot modify the coef of the teaching methods!"

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
	echo -e "\nWhich Semester do you want to select?"
	read semname


	echo -e "\nWhat do you want to delete in this Semester?"
	echo "Enter your choice"
	echo "1. The Semester"

	echo "Exit"

	read repsem
	if [[ $repsem -eq 1 ]]
	then
	    #Delete Semester
	    echo "Not permitted!"
	else
	    echo "Error option: Program Shutdown"
            ext=1
	fi

    elif [[ $rep -eq 2 ]]
    then
	echo -e "\nWhich Semester do you want to delete something?"
        read semname

	echo -e "\nWhat do you want to delete in this Semester"
	echo "Enter your choice"
	echo "1. A UE"
	echo "2. A Module or a Teaching Methods"

	echo "Exit"

	read rep2
	if [[ $rep2 -eq 1 ]]
	then
	    echo -e "\nWhich UE do you want to select?"
	    read uename


	    echo -e "\nWhat do you want to delete in this UE?"
	    echo "Enter your choice"
	    echo "1. The UE"
	    echo "2. The Coef of the UE"

	    echo "Exit"

	   read repue
	   if [[ $repue -eq 1 ]]	#Delete UE
           then

		fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' semester_sheet.txt)
		list=$(echo $fline | sed 's/.*UE://; s/;COEFUE.*//')


		echo -e "\nInsert the new name of the UE?"
		read newuename

		modue=$(sed 's/'$unname'/'$newuename'/' semester.txt)
		cat /dev/null > semester_content.txt
		echo -n "$modue" >> semester_content.txt

           elif [[ $repue -eq 2 ]]	#Delete coef UE
           then

		echo "You cannot delete the coef af the UE!"
           else
               echo "Error option: Program Shutdown"
               ext=1
           fi

	elif [[ $rep2 -eq 2 ]]
	then
	    echo -e "\nWhich UE do you want to delete something?"
            read uename

	    echo -e "\nWhat do you want to delete in this UE?"
	    echo "Enter your choice"
	    echo "1. A Module"
	    echo "2. A Teaching Methods"

	    echo "Exit"

	    read rep3
	    if [[ $rep3 -eq 1 ]]
	    then
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

		    fline=$(grep -o -P '(?<=UE:'$uename').*(?=;FINISH)' semester_sheet.txt)
                    list=$(echo $fline | sed 's/.*MO://; s/;COEF.*//')

		    V=($list)

                    echo -e "\nInsert the new name of the Module?"
                    read newmodname

                    modmod=$(sed 's/'$modname'/'$newmodname'/' semester_sheet.txt)
                    cat /dev/null > semester_sheet.txt
                    echo -n "$modmod" >> semester_sheet.txt


		elif [[ $repmod -eq 2 ]]	#Delete coef Module
		then

		    echo "\nYou cannot modify the coef of the module!"

		else
		    echo "Error option: Program Shutdown"
		    ext=1
		fi


	    elif [[ $rep3 -eq 2 ]]
	    then
		echo -e "\nWhich Module do you want to select before selecting teaching methods?"
                read modname


	        echo -e "\nWhich Teaching Methods do you want to select?"
		read tmname


		echo -e "\nWhat do you want to modify in this Teaching Methods?"
                echo "Enter your choice"
                echo "1. The Teaching Methods"
                echo "2. The Coef of the Teaching Methods"

		echo "Exit"
		read repteach

		if [[ $repteach -eq 1 ]]	#Delete Teaching Methods
		then

                    echo "You can't modify the name of a teaching methods. It is only addable or deletable" 

		elif [[ $repteach -eq 2 ]]	#Delete coef Teaching Methods
		then

                    echo "You cannot modify the coef of the teaching methods!"

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
    echo "Error"
fi

done
