#!/usr/bin/bash
sudo apt-get -y upgrade
d=(make make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev git curl)
e=(pip postgresql)
no="(无)"
g() {
	input=$1
	for a in ${input[*]}; do
		apt-cache pkgnames | grep ^${a}$
		if [ $? -ne 0 ]; then
			sudo apt-get install ${a}
		else
			b=`apt-cache policy ${a} | grep 已安装`
			IFS='：'
			read -a c <<< ${b}
			if [ ${c[1]} == $no ]; then
				sudo apt-get install ${a}
			fi	
		fi
	done
	return
}
f() {
        cd $1
        python setup.py sdist
        cd dist
        pip install $2
        cd ../../
        return
}
g $d
if [ -d ${HOME}/.pyenv ]; then
	rm -rf ${HOME}/.pyenv
fi
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
echo 'export PYENV_ROOT="${HOME}/.pyenv"' >> ${HOME}/.bashrc
echo 'if [ -d "${PYENV_ROOT}" ]; then' >> ${HOME}/.bashrc
echo '	export PATH="${PYENV_ROOT}/bin:${PATH}"' >> ${HOME}/.bashrc
echo 'fi' >> ${HOME}/.bashrc
source ~/.bashrc
echo "finish source the file .bashrc"
if [ `command -v pyenv` ]; then
	pyenv install 3.6.9
	pyenv global 3.6.9
	g $e 
	pip install --upgrade pip
	pyenv virtualenv 3.6.9 upgrid
	source activate upgrid
	f grid-core-db grid-core-db-0.74.tar.gz
	f webtracking-db webtracking-db-0.7.tar.gz
	f service-interceptor service_interceptor-0.4.tar.gz
	cd upgrid/src
	pip install -r requirements.txt
	cd ../../
fi
