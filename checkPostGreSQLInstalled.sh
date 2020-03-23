#!/usr/bin/sh
postGreSql='dpkg-query -s postgresql'
${postGreSql}
if [ $? -ne 0 ]; then
	echo $?
	echo "not installed"
else
	echo "postGreSql installed successfully"
fi
