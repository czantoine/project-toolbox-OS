#!/bin/bash

dir=$(sudo find /home)

echo -e "\nWhat is time in day"
read day

echo -e "\nWhat is time in hour"
read hour

echo -e "\nWhat is time in minute "
read minute

echo -e "\nWhat is time in second "
read second

numchoice=0

while [ "$numchoice" = 0 ]; do
	sleep "$day"d "$hour"h "$minute"m "$second"s
	bash detected_q_r.sh
done
