#!/bin/bash
# 20190408
# 进程守护脚本,可以加入计划任务执行
while true;do
   if ! ps aux |grep httpd |grep -v grep &>/dev/null;then
        systemctl start httpd
   else 
        echo "program is exist"
   fi
done
