#!/bin/bash
# date：2018年3月15日
login="mysql -uroot -S /tmp/mysql2.sock -plvlinux"
$login -e "show processlist" >/tmp/mysql_error.log 2>&1
if [ $? -ne 0 ]
then
    echo "MySQL server something wrong!"
    exit;
else
    $login -e "show slave status\G" > /tmp/mysql_slave_status.log 2>/dev/null
    res=`wc -l /tmp/mysql_slave_status.log| awk '{print $1}'`
    if [ $res -gt 0 ]
    then
        y1=$(grep "Slave_IO_Running:" /tmp/mysql_slave_status.log |awk '{print $2}')
        y2=`grep "Slave_SQL_Running:" /tmp/mysql_slave_status.log |awk '{print $2}'`
        if [ "$y1" == "Yes" ] && [ "$y2" == "Yes" ]
        then
            echo "slave status good!"
        else
            echo "slave down!"
        fi
    fi
fi
