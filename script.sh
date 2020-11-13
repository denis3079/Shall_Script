#!/bin/bash

if [ $# -ne 2 ]
then
   echo "Используйте: $0 два параметра командной строки 1.txt 2.txt..."
   exit
else
   f1="$1"
   f2="$2"
fi
#f1="1.txt"
#f2="2.txt"
echo "======"
n1=""
n2=""
LN=1
paste $1 $2 | while read n1 n2 ; do
    expr $n1 + 0 >/dev/null 2>&1 
    [ $? -gt 1 ] && echo Ошибка в $1 строка $LN: $n1 && exit 1
    expr $n1 + $n2
    [ $? -gt 1 ] && echo Ошибка в $2 строка $LN: $n2 && exit 1   
done
echo "======"
    awk '{total+=$1} END{print total}' 1.txt 2.txt  

