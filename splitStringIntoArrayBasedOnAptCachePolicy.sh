#!/usr/bin/sh
result=`apt-cache policy postgresql | grep 已安装`
IFS='：'
read -a array <<< ${result}
echo ${result}
echo '\n'
echo ${array[1]}
resNo="(无)"
if [ ${array[1]} = $resNo ]; then
	echo "it is not installed"
else
	echo "${array[1]}"
	echo "$resNo"
fi
