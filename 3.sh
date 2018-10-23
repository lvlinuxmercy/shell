#!/bin/bash
#ps axu |grep java |sed '/color/'d |awk '{print $NF}' |awk -F "/" '{print "/"$2"/"$3"/"$4}'
ps axu |grep java |sed '/color/'d |awk '{print $NF}' |cut -d "/" -f1-4 > /tmp/dnsa.txt
read -p "please input cellphone number:" n
for i in `cat /tmp/dnsa.txt`;do
	cd $i
	cat dnsa.log |grep $n -C2 |grep numberInfoQueryRsp 
	if [ $? -ne 0 ];then
		continue
	else
		exit
	fi
done
