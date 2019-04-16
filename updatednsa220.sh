#!/bin/bash
######## 升级220上dnsa,注释组检侧nginx往220机器的转发,220上执行脚本

cd /opt/nginx/conf
mv nginx.conf nginx.conf.bak
mv nginx.conf220 nginx.conf
cd /opt/nginx/sbin
./nginx -t
sleep 1
./nginx -s reload

####备份原来程序，拷贝程序，修改属主属组
t=`date +%Y%m%d`
cd /usr/local/src
ps axu |grep java |sed '/grep/'d |awk '{print $NF}' |cut -d "/" -f1-4 > dir.list
chmod 777 dir.list
for d in `cat dir.list`;do
    cd $d
    mv dnsa-2.0.0-SNAPSHOT.jar dnsa-2.0.0-SNAPSHOT.jar.$t
    cp /home/boco4a/update/dnsa-2.0.0-SNAPSHOT.jar .
    chown sms:oinstall dnsa-2.0.0-SNAPSHOT.jar
done

########杀进程，重启程序
ps aux |grep /utxt/soft/dnsa |grep -v grep |awk '{print $2}' |xargs kill
sleep 10
su - sms
cd /usr/local/src
for d in `cat dir.list`;do
    nohup java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8000,suspend=n -jar $d/dnsa-2.0.0-SNAPSHOT.jar > /dev/null 2>error.log &
done

####ngixn改回配置
exit
sleep 1
cd /opt/nginx/conf
mv nginx.conf nginx.conf220
mv nginx.conf.bak nginx.conf
cd /opt/nginx/sbin
./nginx -t
sleep 1
./nginx -s reload