#遍历两个文件中的字符，从aliveport中选出字符去比对port中的字符
#如果存在相同的，给计数器加一，跳出循环。然后判断计数器的值，如果
#不等于0，则重新赋值为0.如果判断计数器是0，则证明一直执行的是
#continue,没有找到相同的，则输出aliveport中的该字符。
#2018/11/3
#!/bin/bash
m=0
for aliveport in `cat /root/aliveport.txt`;do
	for port in `cat /root/port.txt`;do
		if [ $aliveport == $port ];then
			m=$[$m+1]
			break
		else
			continue
		fi
	done
	if [ $m -eq 0 ];then
		echo $aliveport
	else
		m=0
	fi
done
