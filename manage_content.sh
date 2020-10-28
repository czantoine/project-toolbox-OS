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

echo -e "\nWhat do you want to do ? Insert ADD or DELETE : "
read adel

if [[ $adel = add ]] || [[ $adel = ADD ]]
then
    	echo -e "\nWhat do you want to add ?"
    	echo "Enter your choice"
   	echo "1. UE"
   	echo "2. MO"
	echo "3. TD"
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

		read -p "Do you want add TP for the ${V[i]} ? TAP Y or N : " -n 1 -r
		echo -e "\n"
		pos_number_tp=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;ETP:')
                pos_letter_tp=$(echo "$pos_number_tp" | sed  's/: ;ETP.*//')
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			etp=$(sed -E "${line_number}s/(.{$pos_letter_tp})/& 'Y'/" semester_sheet.txt)
			cat /dev/null > semester_sheet.txt
	                echo "$etp" >> semester_sheet.txt

			echo -e "\nEnter coef  : "
			read coef
			pos_number_coefetp=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;CM:')
	                pos_letter_coeftp=$(echo "$pos_number_coeftp" | sed  's/: ;CM.*//')
			coeftp=$(sed -E "${line_number}s/(.{$pos_letter_coeftp})/& ${coef}/" semester_sheet.txt)
                        cat /dev/null > semester_sheet.txt
                        echo "$coeftp" >> semester_sheet.txt

		else
			etp=$(sed -E "${line_number}s/(.{$pos_letter_tp})/& 'N'/" semester_sheet.txt)
                        cat /dev/null > semester_sheet.txt
                        echo "$etp" >> semester_sheet.txt

			pos_number_coefetp=$( cat semester_sheet.txt | sed -n "${line_number}p" | grep -aob ' ;CM:')
                        pos_letter_coeftp=$(echo "$pos_number_coeftp" | sed  's/: ;CM.*//')
                        coeftp=$(sed -E "${line_number}s/(.{$pos_letter_coeftp})/& 'X'/" semester_sheet.txt)
                        cat /dev/null > semester_sheet.txt
                        echo "$coeftp" >> semester_sheet.txt

		fi

    	else
		echo "Program Shutdown"
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
	    #Suppression Semester
	    echo "Suppression Semester"
	else
	    echo "Program Shutdown"
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
	   if [[ $repue -eq 1 ]]
           then
                #Suppression UE
		echo "Suppression UE"

           elif [[ $repue -eq 2 ]]
           then 
                #Suppression COEF UE
		echo "Suppression coef UE "
           else
               echo "Program Shutdown"
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
                #teachm=$uename/$modname/$tmname

                echo -e "\nWhat do you want to delete in this Module?"
                echo "Enter your choice"
                echo "1. The Module"
                echo "2. The Coef of the Module"

		echo "Exit"

		read repmod
		if [[ $repmod -eq 1 ]]
		then
		    #Suppression Module
		    echo "Suppression Module"

		elif [[ $repmod -eq 1 ]]
		then
		    #Suppression coef Module
		    echo "Suppression coef module"


		else
		    echo "Program Shutdown"
		    ext=1
		fi
		#teachm=$uename/$modname/$tmname/COEF$tmname
		# Supression COEF + EVAL
		#teachm=$uename/$modname/$tmname/E$tmname


	    elif [[ $rep3 -eq 2 ]]
	    then
		echo -e "\nWhich Module do you want to select before selecting teaching methods?"
                read modname


	        echo -e "\nWhich Teaching Methods do you want to select?"
		read tmname
		teachm=$uename/$modname/$tmname/COEF$tmname

		echo -e "\nWhat do you want to delete in this Teaching Methods?"
                echo "Enter your choice"
                echo "1. The Teaching Methods"
                echo "2. The Coef of the Teaching Methods"

		echo "Exit"
		read repteach

		if [[ $repteach -eq 1 ]]
		then
		    #Suppression Teaching Methods
		    echo "Suppression Teaching Methods"

		elif [[ $repteach -eq 2 ]]
		then 
		    #Suppression coef Teaching Methods
		    echo "Suppression coef of the Teaching Methods"

		else
		    echo "Program Shutdown"
		    ext=1
		fi

	    else
		echo "Program Shutdown"
        	ext=1
	    fi

    	else
	    echo "Program Shutdown"
            ext=1
        fi

    else
    	echo "Program Shutdown"
    	ext=1
    fi


else
    echo "no"
fi

done
