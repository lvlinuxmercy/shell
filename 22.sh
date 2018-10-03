#!/bin/bash
if_install()
{
    rpm -q $1 &>/dev/null
    if [ $? -eq 0 ]
    then 
	echo "the package already exist"
	return 0
    else
	echo "the package not found"
	return 1
    fi
}
if_install httpd
if [ $? -eq 0 ]
then 
    if ! pgrep httpd >/dev/null
    then
	systemctl start httpd
    fi
else
    yum install -y httpd
    systemctl start httpd
fi
