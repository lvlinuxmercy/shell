#!/bin/bash
######## ����222��dnsa,ע������nginx��222������ת��,�ýű���220��ִ��
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
read -p "�밴��Ҫ����1Ϊͣ��222�˿ڣ�2Ϊ�ָ��˿�" n
case $n in 
1)
 stopport
 ;;
2)
 startport
 ;;
esac