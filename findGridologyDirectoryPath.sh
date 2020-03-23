#!/usr/bin/sh
currentUser=`whoami`
echo ${currentUser}
cd /home/${currentUser}
target=`find . -name gridology`
echo ${target}
if [ $? -ne 0 ]; then
	echo "gridology directory didn't exist"
else
	
