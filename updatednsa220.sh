#!/bin/bash
######## ����220��dnsa,ע������nginx��220������ת��,220��ִ�нű�

cd /opt/nginx/conf
mv nginx.conf nginx.conf.bak
mv nginx.conf220 nginx.conf
cd /opt/nginx/sbin
./nginx -t
sleep 1
./nginx -s reload

####����ԭ�����򣬿��������޸���������
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

########ɱ���̣���������
ps aux |grep /utxt/soft/dnsa |grep -v grep |awk '{print $2}' |xargs kill
sleep 10
su - sms
cd /usr/local/src
for d in `cat dir.list`;do
    nohup java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8000,suspend=n -jar $d/dnsa-2.0.0-SNAPSHOT.jar > /dev/null 2>error.log &
done

####ngixn�Ļ�����
exit
sleep 1
cd /opt/nginx/conf
mv nginx.conf nginx.conf220
mv nginx.conf.bak nginx.conf
cd /opt/nginx/sbin
./nginx -t
sleep 1
./nginx -s reload