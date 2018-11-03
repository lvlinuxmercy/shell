#!/bin/bash
m=0
for port in `cat /tmp/port.txt`;do
	netstat -lnp |grep -w "$port"
	if [ $? -ne 0 ];then
		echo $port >> /tmp/portfail.log
		m=$[$m +1]
	else
	continue
	fi
done
if [ $m -eq 0 ];then 
	echo "program start ok"
	>/tmp/portfail.log
else
	echo $m
fi

