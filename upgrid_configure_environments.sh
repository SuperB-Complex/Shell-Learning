#!/usr/bin/bash
sudo apt-get -y upgrade
d=(make make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev git curl)
no="(无)"
install() {
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
			else
				echo "${a} already installed"	

			fi	
		fi
	done
	return
}
install $d
if [ -d ${HOME}/.pyenv ]; then
	echo "pyenv directory already exist!"
else
	curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
fi
echo 'export PYENV_ROOT="${HOME}/.pyenv"' >> ~/.bashrc
echo 'if [ -d "${PYENV_ROOT}" ]; then' >> ~/.bashrc
echo '	export PATH="${PYENV_ROOT}/bin:${PATH}"' >> ~/.bashrc
echo 'fi' >> ~/.bashrc
source ~/.bashrc
echo "finish source the file .bashrc"
installing() {
	cd $1
	python setup.py sdist
	cd dist
	pip install $2
	cd ../../
	return
}
if [ `command -v pyenv` ]; then
	pyenv install 3.6.9
	pyenv global 3.6.9
	e=[pip postgresql]
	install $e 
	pip install --upgrade pip
	echo "finish install pip and postgresql"
	echo "about to create a new virtual env upgrid"
	pyenv virtualenv 3.6.9 upgrid
	echo "about to activate the pyenv upgrid"
	source activate upgrid
	installing grid-core-db grid-core-db-0.74.tar.gz
	installing webtracking-db webtracking-db-0.7.tar.gz
	installing service-interceptor service_interceptor-0.4.tar.gz
	cd upgrid/src
	pip install -r requirements.txt
	cd ../../
else
	echo "pyenv is not installed"
fi
