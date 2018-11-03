#过滤出存活的dnsa进程对应的模块路径并存放到一个文件中
#循环遍历这些路径，过滤其中的日志，找到请求过的号码
#!/bin/bash
ps axu |grep java |sed '/grep/'d |awk '{print $NF}' |cut -d "/" -f1-4 > /tmp/dnsa.txt
read -p "please input cellphone number:" n
for i in `cat /tmp/dnsa.txt`;do
	cd $i
	cat dnsa.log |grep $n -C10 |grep Successfully 
	if [ $? -ne 0 ];then
		continue
	else
		echo $i
        exit
	fi
done
