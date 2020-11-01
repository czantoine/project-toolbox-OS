#!/bin/bash

echo -e "\n What you want generate work progress or grades ?"
echo "1. Work progress"
echo "2. Grades"
read fonc

echo -e "\n What is semester you want go ?"
read go_s
echo -e "\n What is UE you want go ?"
read go_ue
echo -e "\n What is MO you want go ?"
read go_mo
echo -e "\n What is course you want go ?"
read go_c

if [[ $fonc = 1 ]]
then
	test=$($go_s/$go_ue/$go_mo/$go_c/progression.info)
	gnuplot -persist -e 'set terminal canva ; set grid ; set style data histograms ; set style fill solid 1.00 border -1 ; set title "Work progress" ; set ylabel "Pourcentage" ;set xtic out rotate by 45; set xtic font ",12" ;set yrange [0:100];set output "test.html"; plot "'${test}'" using 2:xtic(1) title "Avancement"'
	xdg-open test.html
	rm test.html

elif [[ $fonc = 2 ]]
then
	echo ""
else
	exit 1
fi
