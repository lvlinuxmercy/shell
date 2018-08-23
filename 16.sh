#!/bin/bash
judge_number()  # 判断数字是否为纯数字
{
if [ -z "$1" ];then
    echo "你必须输入一个数。"
    exit
fi
n=`echo $1|sed 's/[0-9]//g'`
if [ -n "$n" ];then
    echo "你输入的数字有误"
    exit
fi
}
read -p  "请输入你想要暂停的数字：" number1

judge_number $number1

for i in `seq 1 $number1`;do
    echo $i
done  # 按要求打印数字
while :;do
read -p "是否继续输入数字？（输入yes或者no）" a #提示是否继续输入 输入yes 或者no

case $a in
    yes|YES)
    read -p "请继续输入您想要暂停的数字（要大于$number1):" number2
    judge_number $number2
    if [ $number2 -le $number1 ];then
	echo "请输入一个比$number1大的数字。"
	exit
    fi
    number3=$[$mumber1+1]
    for h in `seq $number3 $number2`;do
	echo $h
    done
    number1=$number2
    ;;
    no|NO)
    exit
    ;;# 判断结果给出相应操作
    *)
    echo "请输入yes或者no"
    exit
    ;;
esac
done









