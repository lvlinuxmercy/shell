#!/bin/bash
read -p "please input the new ip: " n
for f in `cat /tmp/dirlist.txt`;do
	cd $f
	sed -i "s/10.168.63.211/$n/g" config.properties
	sh restart.sh
done
