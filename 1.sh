#!/bin/bash
User=root
passWord=123
rpm -q sshpass &>/dev/null || yum -y install sshpass
ping www.qq.com -c3 >/dev/null
if [ $? -ne 0 ]
then
	echo "check your network"
	exit
fi
[ -d ~/.ssh ] || mkdir ~/.ssh;chmod 700 ~/.ssh
echo "going to creating keys"
rm -rf ~/.ssh/*
ssh-keygen -t dsa -f ~/.ssh/id_dsa -P "" &>/dev/null
for ip in `cat /tmp/ip.log`
do
    ping $ip -c2 &>/dev/null
    if [ $? -ne 0 ];then
	echo "$ip can't connect,check the network"
	continue
    fi
    sshpass -p "$passWord" ssh-copy-id -i ~/.ssh/id_dsa.pub -o StrictHostKeyChecking=no ${User}@$ip &>/dev/null
    echo "$ip public_key diributiton success"
done
