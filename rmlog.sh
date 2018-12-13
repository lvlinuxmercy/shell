#!/bin/bash
#当日志大于4G时，清空一次
du -sh xscf_trace.log > /root/a.txt
a=`cat a.txt |awk '{print $1}'`
if echo $a |grep -q "G";then
    b=`echo $a |awk -F "[a-zA-Z]" '{print $1}'`
    if [ `expr $b \> 4` -eq 1 ];then
        >/root/xscf_trace.log
    fi
fi
