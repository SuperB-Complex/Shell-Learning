#!/usr/bin/sh
switchDirectory='cd gridology/grid-core-db/'
bulidSourceDistribution='python setup.py sdist'
${switchDirectory}
pwd
if [ $? -ne 0 ]; then
	echo "directory change failed"
else
	echo "building distribution failed"
fi
${bulidSourceDistribution}
if [ $? -ne 0 ]; then
	echo "bulding distribution failed"
else
	echo "building distribution successfully"
fi
cd ../
pwd
