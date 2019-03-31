#!/bin/bash
#检查日志大小，当大于4G时，清空一次
#du -sh xscf_trace.log > /root/a.txt
#a=`cat /root/a.txt |awk '{print $1}'`
#if echo $a |grep -q "G";then
#    b=`echo $a |awk -F "[a-zA-Z]" '{print $1}'`
#    if [ `expr $b \> 4` -eq 1 ];then #小数的比较
#        >/root/xscf_trace.log
#    fi
#fi


# 检查磁盘使用率，当大于85%时，清理三天日志
# 2019-3-31
diskused=`df -h |grep utxt |awk '{print $5}' |cut -c 1-2`
echo $diskused > /tmp/disk.txt
t10=`date -d "10 days ago" +%Y-%m-%d`
t11=`date -d "11 days ago" +%Y-%m-%d`
t12=`date -d "12 days ago" +%Y-%m-%d`
if [ $diskused -gt "85" ];then
	cd /utxt/soft/dm_as/proglog
	[ -f $t12 ]||rm -rf aslianjia.log.$t12*
	[ -f $t11 ]||rm -rf aslianjia.log.$t11*
  	[ -f $t10 ]||rm -rf aslianjia.log.$t10*
	cd /utxt/soft/dsf-as_axb/prolog
	[ -f $t12 ]||rm -rf as.log.$t12*
	[ -f $t11 ]||rm -rf as.log.$t11*
	[ -f $t10 ]||rm -rf as.log.$t10*
fi

