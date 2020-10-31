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
echo -e "\n What is name of this new work?"
read name_file

touch $go_s/$go_ue/$go_mo/$go_c/$name_file

touch $go_s/$go_ue/$go_mo/$go_c/progression.info

echo "$name_file : 00%" >> $go_s/$go_ue/$go_mo/$go_c/progression.info

