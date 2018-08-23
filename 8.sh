#!/bin/bash
for i in `seq 1 5`;do
    if [ $i -eq 4 ];then
	exit
    fi
    echo $i
done
echo "hello world"
