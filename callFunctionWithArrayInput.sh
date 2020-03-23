#!/usr/bin/bash
arr=(1 2 3 4 5)
func() {
	a=$1
	for item in ${a[*]}; do
	       echo $item
       	done
	return	
}

func $arr
