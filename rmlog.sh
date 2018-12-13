#/bin/bash
du -sh xscf_trace.log > a.txt
a=`cat a.txt |awk '{print $1}'`
if echo $a |grep -q "G";then
    b=`echo $a |awk -F "[a-zA-Z]" '{print $1}'`
    if [ `expr $b \> 4` -eq 1 ];then
        >xscf_trace.log
    fi
fi
