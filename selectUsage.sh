#!/usr/bin/sh
echo "the path type you are going to enter: "
target="path is : "
select item in "relativePath" "absolutePath"
do 
	case ${item} in 
		relativePath) read -p "path is: " path 
			break
			;;
		absolutePath) read -p "path is: " path 
			cd /
			break
			;;	
		*) echo "wrong selection, please select again!" 
			continue
			;;
	esac
done
echo ${path}
cd ${path}
