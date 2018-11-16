#!/bin/bash
read -p "please input serverkey: " n
if [ $n -ne 1011 ] || [ $n -ne 1022 ] || [ $n -ne 1021 ] [ $n -ne 2001 ] || [ $n -ne 2002 ];then
   echo "serverkey is not exit,please input 1011 1021 1022 2001 2002" && exit
fi
read -p "single or many ?please input 1 or 2: " m
#if [ $m -eq 1 ];then
#   read -p "please input cellnumber: " p
#   echo $p > num.list
#else
#   continue
#fi
case $m in
1)
 read -p "please input cellnumber: " p
 echo $p > num.list
 ;;
2)
 continue
 ;;
esac
imsicheck()
{
#sed -i "/^servicekey/s/.*/servicekey=$n/" dn_imsicheck.sh
IFS=$'\n'
for num in `cat num.list`;do
  cellnum=`echo $num |awk '{print $1}'`
  checknum=`echo $num |awk '{print $2}'`
  sed -i "/^dn/s/.*/dn=$cellnum/" dn_imsicheck.sh
  sed -i "/^checknum/s/.*/checknumber=$checknum/" dn_imsicheck.sh 
  sh dn_imsicheck.sh
done
}
positioncheck()
{
#sed -i "/^servicekey/s/.*/servicekey=$n/" dn_imsicheck.sh
IFS=$'\n'
for num in `cat num.list`;do
  cellnum=`echo $num |awk '{print $1}'`
  checknum=`echo $num |awk '{print $2}'`
  sed -i "/^dn/s/.*/dn=$cellnum/" dn_position.sh
  sed -i "/^position/s/.*/position=$checknum/" dn_position.sh
  sh dn_position.sh
done
}
dncheck()
{
sed -i "/^servicekey/s/.*/servicekey=$n/" dn.sh
for num in `cat num.list`;do
  sed -i "/^dn/s/.*/dn=$num/" dn.sh
  sh dn.sh
done
}
case $n in
1011|1021|1022)
 dncheck
 ;;
2002)
 imsicheck
 ;;
2001)
 positioncheck
 ;;
esac
