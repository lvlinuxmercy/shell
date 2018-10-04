#!/bin/bash
sh -n $1 2>/tmp/err.log
if [ $? -eq 0 ]
then 
    echo "the script is ok"
else
    cat /tmp/err.log
    read -n1 -p "please input q/Q to exit,or other to edit by vim: " n
    if [ $n == "q" ]||[ $n == "Q" ]
    then
        printf "\n" 
	exit
    else
	vim $1	
	exit
    fi
fi
