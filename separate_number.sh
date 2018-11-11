#!/bin/bash
cm=0
cu=0
ct=0
sum=0
for dn in `cat /tmp/dn.txt`;do
	x=`echo $dn |cut -c1-3`
	if grep -q $x /tmp/cm.txt;then
		if [ $x == '170' ];then
			y=`echo $dn |cut -c1-4`
			if grep -q $y /tmp/cm.txt;then
				cm=$[$cm+1]
			elif grep -q $y /tmp/cu.txt;then
				cu=$[$cu+1]
			else 
			    ct=$[$ct+1]
			fi
		else 
  			cm=$[$cm+1]
		fi
	elif grep -q $x /tmp/cu.txt;then
		cu=$[$cu+1]
	else
		ct=$[$ct+1]
	fi
done
sum=$[$cm+$cu+$ct]
echo "sum=$sum"
echo "cm=$cm"
echo "cu=$cu"
echo "ct=$ct"

