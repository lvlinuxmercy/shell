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
# 2019-4-03
#!/bin/bash
diskused=`df -h |grep utxt |awk '{print $5}' |cut -c 1-2`
diskused1=`df -h |grep utxt |awk '{print $5}'`
date=`date +%F-%H:%M`
echo $date >> /tmp/disk.txt
echo "before clean is $diskused" >> /tmp/disk.txt
t10=`date -d "10 days ago" +%Y-%m-%d`
t9=`date -d "9 days ago" +%Y-%m-%d`
t8=`date -d "8 days ago" +%Y-%m-%d`
t11=`date -d "11 days ago" +%Y-%m-%d`
t12=`date -d "12 days ago" +%Y-%m-%d`
if [ $diskused -gt "85" ];then
	cd /utxt/soft/dm_as/proglog
	rm -rf aslianjia.log.$t12*
	rm -rf aslianjia.log.$t11*
  	rm -rf aslianjia.log.$t10*
  	rm -rf aslianjia.log.$t8*
  	rm -rf aslianjia.log.$t9*
	cd /utxt/soft/dsf-as_axb/prolog
	rm -rf as.log.$t8*
	rm -rf as.log.$t9*
	rm -rf as.log.$t12*
	rm -rf as.log.$t11*
	rm -rf as.log.$t10*
fi
diskused2=`df -h |grep utxt |awk '{print $5}'`
echo "after clean is $diskused2" >> /tmp/disk.txt

