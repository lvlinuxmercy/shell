#!/bin/bash
# check date format
if [ $# -ne 1 ]||[ ${#1} -ne 8 ]
then
    echo "Usage:bash $0 yyyymmdd"
    exit 1
fi
# resolution of date
datem=$1
year=${datem:0:4}
month=${datem:4:2}
day=${datem:6:2}
# filter the zero if the date less than 10,because of command cal show
if echo $day|grep -q '^0'
then
    day=`echo $day|sed 's/^0//'`
fi
# judge date with cal show
if cal $month $year &>/dev/null
then
    if	cal $month $year |egrep -qw "$day"
    then
	echo "date right"
    else
	echo "date error"
    fi
else
    echo "date error"
fi
sdfsdf
