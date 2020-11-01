#!/bin/bash

all_name=$(grep 'student' /etc/group | sort)
clear_group=$(echo $all_name | sed 's/.*://')

list=$(echo $clear_group | tr "," "\n")

#compter le nombre de la liste pour changer x

V=($list)

for i in "${!V[@]}"; do
    printf 'V[%s] = %s\n' "$i" "${V[i]}"
done

for ((i = 0 ; i < $x ; i++)); do

	directory=$(sudo find /home/${V[i]} -name "progression.info")
	uu=$(echo $directory | tr " " "\n")
	D=($uu)

	#compter le nombre de directory pour set i

	for i in "${!D[@]}"; do
    		printf 'D[%s] = %s\n' "$i" "${D[i]}"
	done
done
