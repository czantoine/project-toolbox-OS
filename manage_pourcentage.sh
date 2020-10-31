#!/bin/bash

echo -e "\n Add work file in course :"
echo -e "\n What is semester you want go ?"
read go_s
echo -e "\n What is UE you want go ?"
read go_ue
echo -e "\n What is MO you want go ?"
read go_mo
echo -e "\n What is course you want go ?"
read go_c

cd $go_s/$go_ue/$go_mo/$go_c/

echo -e "\n This is your file with progression :"
cat progression.info

echo -e "\n What is file you want update progression "
read file_update

echo -e "\n What is the new pourcentage ?"
read pourcent

line_number=$(grep -n ''$file_update'' progression.info | sed 's/^\([0-9]\+\):.*$/\1/')
pos_number=$( cat progression.info | sed -n "${line_number}p" | grep -aob '%')


# delete % | delete 1 digit | delete second digit | add new number and %
rep=$(sed "${line_number}s/\%$//" progression.info | sed "${line_number}s/[0-9]$//" | sed "${line_number}s/[0-9]$/$pourcent%/")
cat /dev/null > progression.info
echo "$rep" >> progression.info



