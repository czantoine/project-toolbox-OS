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
		fword=$(grep -Eo '^[^ ]+' semester_sheet.txt)
		echo -e "\nThis is what you have :\n$fword"
		echo -e "\nwhich one do you want to add ? "
		read add
		line_number=$(grep -n '$add' semester_sheet.txt | sed 's/^\([0-9]\+\):.*$/\1/')
		echo "\nWhich name of module you want add ?"
		read name
		aa=$(sed -E "${line_number}s/(.{4})/&${name}/" semester_sheet.txt)
		cat /dev/null > semester_sheet.txt
		echo "$aa" >> semester_sheet.txt
    	else
		echo "Program Shutdown"
        	ext=1
   	 fi



elif [[ $adel = delete ]] || [[ $adel = DELETE ]]
then
    echo -e "\nWhat do you want to delete ?"
    echo "Enter your choice"
    echo "1. A UE"
    echo "2. A Module or a Teaching Methods"

    echo "Exit"

    read rep
    if [[ $rep -eq 1 ]]
    then
	echo -e "\nWhich UE do you want to select?"
	read uename


	echo -e "\nWhat do you want to delete in this UE?"
	echo "Enter your choice"
	echo "1. The UE"
	echo "2. The COEF of the UE"

	echo "Exit"

	read repue
	if [[ $repue -eq 1 ]]
	then
	    #Suppression UE
	    echo "Suppression UE"
	elif [[ $repue -eq 2 ]]
	then
	    #Suppression COEF UE
	    echo "Suppression  coef UE"
	else
	    echo "Program Shutdown"
            ext=1
	fi
    elif [[ $rep -eq 2 ]]
    then
	echo -e "\nWhich UE do you want to delete something?"
        read uename

	echo -e "\nWhat do you want to delete in this UE"
	echo "Enter your choice"
	echo "1. A Module"
	echo "2. A Teaching Methods"

	read rep2
	if [[ $rep2 -eq 1 ]]
	then
	    echo -e "\nWhich Module do you want to select?"
	    read modname

	    echo -e "\nWhat do you want to delete in this module?"
	    echo "Enter your choice"
	    echo "1. The Module"
	    echo "2. The Coef of the Module"

	   read repmod
	   if [[ $repmod -eq 1 ]]
           then
                #Suppression mod
		echo "Suppression module"

           elif [[ $repmod -eq 2 ]]
           then 
                #Suppression COEF mod
		echo "Suppression coef module"
           else
               echo "Program Shutdown"
               ext=1
           fi

	elif [[ $rep2 -eq 2 ]]
	then
	    echo -e "\nWhich Module do you want to delete something?"
            read modname

	    echo -e "\nWhat do you want to delete in this module?"
	    echo "Enter your choice"
	    echo "1. A Teaching Methods"
	    echo "2. The Coef of a Teaching Methods"

	    read rep3
	    if [[ $rep3 -eq 1 ]]
	    then
		echo -e "\nWhich Teaching Methods do you want to delete?"
		read tmname
                #teachm=$uename/$modname/$tmname

		# Suppression Teaching Methods
		echo "Suppression Teaching Methods"

		#teachm=$uename/$modname/$tmname/COEF$tmname
		# Supression COEF + EVAL
		#teachm=$uename/$modname/$tmname/E$tmname


	    elif [[ $rep3 -eq 2 ]]
	    then
	        echo -e "\nWhich Teaching Methods do you want to delete the coef?"
		read tmname
		teachm=$uename/$modname/$tmname/COEF$tmname

		# Suppression Coef Teaching Methods
		echo "Suppression coef Teaching Methods"

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
