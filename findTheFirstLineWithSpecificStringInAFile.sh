#!/usr/bin/bash
result=`grep -n "PYENV_ROOT" ${HOME}/.bashrc | head -1`
echo ${result}
IFS=':'
read -a array <<< ${result}
echo ${array[0]}
b=$(( array[0]+3 ))
echo ${b}
echo "start"
x() {
        if [ -d ${HOME}/.pyenv ]; then
                rm -rf ${HOME}/.pyenv
                m=`grep -n "PYENV_ROOT" ${HOME}/.bashrc | head -1`
                IFS=':'
                read -a o <<< ${m}
                g=${o[0]}
                if [ -z $g ]; then
                       echo "no desired content"
                else
                        echo "has desired content"
			h=$(( g+3 ))
                        sed "$g,$h d" ${HOME}/.bashrc >> ${HOME}/.bashrcc
                fi

        fi
}
x
