#!/usr/bin/bash

func() {
	if [ $1 == 1 ]; then
		echo "input is 1"
		return
	else
		echo "input is not 1"
		return
	fi
	}
func 1
func 2
