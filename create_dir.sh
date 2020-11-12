#!/bin/bash

echo -e "\n What is semester you want add ?"
read go_s
echo -e "\n What is UE you want add ?"
read go_ue
echo -e "\n What is MO you want add ?"
read go_mo
echo -e "\n What is course you want add ?"
read go_c

echo -e "\n What is the teacher you want do ?"
read ttt

cd /home/$ttt

sudo mkdir -m 700 $go_s
sudo chown $ttt:$ttt $go_s

sudo mkdir -m 700 $go_s/$go_ue
sudo chown $ttt:$ttt $go_s/$go_ue

sudo mkdir -m 700 $go_s/$go_ue/$go_mo
sudo chown $ttt:$ttt $go_s/$go_ue/$go_mo

sudo mkdir -m 700 $go_s/$go_ue/$go_mo/$go_c
sudo chown $ttt:$ttt $go_s/$go_ue/$go_mo/$go_c

echo "It's ok"


