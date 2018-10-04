#!/bin/bash
ip()
{
ifconfig |grep "$1: " -A1 |grep 'inet'|awk '{print $2}'
}
read -p "please input a name of network card: " name
ip $name
n=`ifconfig |grep "$name"`
if [ -z "$n" ];then
    echo "the eth is not exist"
    exit 1
fi
m=`ifconfig |grep "$name" -A1 |grep 'inet'`
if [ -z "$m" ];then
    echo "the eth has no ip assigned"
fi
