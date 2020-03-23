#!/usr/bin/sh
prerequist=(python-pip git make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev postgresql)
for item in ${prerequist[@]}; do
	apt-cache search ${item}
	if [ $? -ne 0 ]; then 
		sudo apt install ${item}
	fi
done	
