#!/bin/bash
for f in `cat /root/aliveport.txt`;do
	if grep -qw "$f" /root/port.txt;then
		continue	
	else
		echo $f
	fi
done
