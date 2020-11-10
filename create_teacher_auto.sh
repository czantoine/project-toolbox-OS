#!/bin/bash

# username:email:group:password

filein="teacher.csv"
IFS=$'\n'

sudo groupadd teacher

server=$(cat file_system/.numserver)

if [ ! -f "$filein" ]
then
	echo "Cannot find file $filein"
else

	groups=(`cut -d: -f 3 "$filein"`)
  	name=(`cut -d: -f 1 "$filein"`)
  	mail=(`cut -d: -f 2 "$filein"`)
 	pas=(`cut -d: -f 4 "$filein"`)

  	for group in ${groups[*]}
  	do
    		grep -q "^$group" /etc/group ; let x=$?
	   	if [ $x -eq 1 ]
    		then
     			sudo groupadd "$group"
    		fi
  	done

  	x=0
  	for user in ${name[*]}
  	do
		sudo useradd ${name[$x]} --groups teacher,${groups[$x]}
		echo "${name[$x]}:${pas[$x]}" | sudo chpasswd
		sudo mkdir -p /home/${name[$x]}

		sudo cp toolbox_teacher.sh /home/${name[$x]}
		sudo cp grade.sh /home/${name[$x]}

		touch .email
		echo "${mail[$x]}" >> .email
		sudo cp .email /home/${name[$x]}
		rm .email

		sudo mkdir -m 770 /home/${name[$x]}/ARCHIVE
		cd /home/${name[$x]}
		sudo chgrp ${groups[$x]} ARCHIVE

    		echo "Welcome! Your account has been created.  Your username is ${name[$x]} and password is \"${pas[$x]}\" without the quotes. The number of server is $server" | mail -s "New Account for ${name[$x]}" ${mail[$x]} -b root ${name[$x]}
    		x=$x+1
    		echo -n "..."
    		sleep .10
  	done
  	sleep .10
  	echo " "
  	echo "Complete. Accounts have been created."
fi
