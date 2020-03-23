#!/usr/bin/sh
apt-cache pkgnames | grep ^make$
if [ $? -ne 0 ]; then
	echo "not installed"
else
	echo "make is supposed to be installed"
fi

apt-cache pkgnames | grep ^java$
if [ $? -ne 0 ]; then
	echo "yes, java is not installed"
else
	echo "something goes wrong, java should be not installed already"
fi
