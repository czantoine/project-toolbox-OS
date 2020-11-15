#!/bin/bash

# username:email:group:password

filein="student.csv"
IFS=$'\n'

sudo groupadd student

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
		sudo useradd ${name[$x]} --groups student,${groups[$x]}
		echo "${name[$x]}:${groups[$x]}" | sudo chpasswd
		sudo mkdir -p /home/${name[$x]}
		sudo chown ${name[$x]}:${groups[$x]} /home/${name[$x]}

		sudo cp toolbox_student.sh /home/${name[$x]}
		sudo cp semester_content.sh /home/${name[$x]}
		sudo cp manage_content.sh /home/${name[$x]}
		sudo cp manage_rwx.sh /home/${name[$x]}
		sudo cp add_work.sh /home/${name[$x]}
		sudo cp manage_pourcentage.sh /home/${name[$x]}
		sudo cp gnuplot.sh /home/${name[$x]}
		sudo cp question.remark.sh /home/${name[$x]}
		sudo cp send.sh /home/${name[$x]}
		sudo cp submit_work.sh /home/${name[$x]}

		touch .email
		echo "${mail[$x]}" >> .email
		sudo cp .email /home/${name[$x]}
		rm .email

    		echo "Welcome! Your account has been created.  Your username is ${name[$x]} and password is \"${pas[$x]}\" without the quotes. The number of server is $server" | mail -s "New Account for ${name[$x]}" ${mail[$x]} -b root ${name[$x]}
    		x=$x+1
    		echo -n "..."
    		sleep .10
  	done
  	sleep .10
  	echo " "
  	echo "Complete. Accounts have been created."
fi
