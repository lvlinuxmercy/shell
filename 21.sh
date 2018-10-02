#!/bin/bash
read -p "please input the network card name: " n
if ! ifconfig |grep -wq "$n"
then 
    echo "please input right name of network card"
    exit 1
fi
sar -n DEV 1 10 |grep -w "$n" > /tmp/sar.log
netin=`tail -1 /tmp/sar.log |awk '{print $5}' |sed 's/\.//'`
netout=`tail -1 /tmp/sar.log |awk '{print $6}' |sed 's/\.//'`
if [ $netin == "000" ] && [ $netout == "000" ]
then
    ifdown "$n" && ifup "$n"
else
    echo "$n" ok
fi

