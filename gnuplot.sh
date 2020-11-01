#!/bin/bash

echo -e "\n What you want generate work progress or grades ?"
echo -e "WARNING You must do ssh -X user@ipaddress to access all functionnalities"
echo "1. Work progress"
echo "2. Grades"
read fonc

if [[ $fonc = 1 ]]
then
	echo -e "\n What is semester you want go ?"
	read go_s
	echo -e "\n What is UE you want go ?"
	read go_ue
	echo -e "\n What is MO you want go ?"
	read go_mo
	echo -e "\n What is course you want go ?"
	read go_c

	user=$USER
	cd $go_s/$go_ue/$go_mo/$go_c/
	cp progression.info /home/$user/
	cd --
	gnuplot -persist -e 'set terminal canva ; set grid ; set style data histograms ; set style fill solid 1.00 border -1 ; set title "Work progress" ; set ylabel "Pourcentage" ;set xtic out rotate by 45; set xtic font ",12" ;set yrange [0:100];set output "test.html"; plot "progression.info" using 2:xtic(1) title "Avancement"'
	firefox test.html
	rm test.html
	rm progression.info

elif [[ $fonc = 2 ]]
then
	echo -e "\n What is semester you want go ?"
        read go_s
        echo -e "\n What is UE you want go ?"
        read go_ue
        echo -e "\n What is MO you want go ?"
        read go_mo
        echo -e "\n What is course you want go ?"
        read go_c

        user=$USER
        cd $go_s/$go_ue/$go_mo/$go_c/
        cp grade.info /home/$user/
        cd --
        gnuplot -persist -e 'set terminal canva ; set grid ; set style data histograms ; set style fill solid 1.00 border -1 ; set title "Work progress" ; set xtic out rotate by 45; set xtic font ",12" ;set yrange [0:20];set output "test.html"; plot "grade.info" using 2:xtic(1) title "Grade /20"'
        firefox test.html
        rm test.html
        rm grade.info
else
	exit 1
fi
