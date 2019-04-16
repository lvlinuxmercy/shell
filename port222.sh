#!/bin/bash
######## 升级222上dnsa,注释组检侧nginx往222机器的转发,该脚本在220上执行
stopport()
{
cd /opt/nginx/conf
mv nginx.conf nginx.conf.bak
mv nginx.conf222 nginx.conf
cd /opt/nginx/sbin
./nginx -t
sleep 1
./nginx -s reload
}
startport()
{
cd /opt/nginx/conf
mv nginx.conf nginx.conf222
mv nginx.conf.bak nginx.conf
cd /opt/nginx/sbin
./nginx -t
sleep 1
./nginx -s reload
}
read -p "请按需要操作1为停掉222端口，2为恢复端口" n
case $n in 
1)
 stopport
 ;;
2)
 startport
 ;;
esac