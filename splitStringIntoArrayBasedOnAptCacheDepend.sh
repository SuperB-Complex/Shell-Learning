#!/usr/bin/sh
result=`apt-cache depends python | grep 依赖:`
IFS=' '
read -a array <<< ${result}
echo ${result}
echo '\n'
echo ${result[@]}
echo '\n'
echo ${array[@]}
echo '\n'
for arg in ${result[@]}; do
	echo ${arg}
	read -a arrayRight <<< ${arg}
done
echo ${arrayRight[@]}
arr=( aaa bbb ccc )
echo ${arr[@]}
