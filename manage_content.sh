#!/bin/bash

read -p "Do you want see tree of your directory ? TAP Y or N : " -n 1 -r
echo -e "\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
    tree
else
    echo -e "\n"
fi

while [ "$rep" != "Yes" ]; do

echo -e "\nWhat you want ? TAP ADD or DELETE : "
read adel

if [[ $adel = add ]] || [[ $adel = ADD ]]
then
    echo -e "\nWhat you want add ?"
    echo "Enter choice :"
    echo "1. UE"
    echo "2. MO"
    echo "Exit"
    read rep
    if [[ $rep = 1 ]]
    then
        echo -e "\n" >> semester_content.sh
        bash semester_content.sh
    elif [[ $rep = 2 ]]
    then
        echo -e "What is UE you want add Module ?"
        echo -e ""

    else
        exit 1
    fi


elif [[ $adel = delete ]] || [[ $adel = DELETE ]]
then
    echo -e "\nWhat you want delete ?"

else
    echo "no"
fi

done