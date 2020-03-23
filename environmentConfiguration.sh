#!/usr/bin/sh
sudo apt-get -y upgrade
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev git curl
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
echo 'export PATH="~/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrc
pyenv global 3.6.9
sudo apt-get install -y python3-pip postgresql
echo "about to init shell with pyenv"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
exec $SHELL
echo "about to activate the pyenv upgrid"
pyenv activate upgrid
cd grid-core-db
python setup.py sdist
cd dist
pip install grid-core-db-0.74.tar.gz
cd ../../webtracking-db
python setup.py sdist
cd dist
pip install webtracking-db-0.7.tar.gz
cd ../../service-interceptor
python setup.py sdist
cd dist 
pip install service-interceptor-0.4.tar.gz
cd ../../upgrid/src
pip install -r requirements.txt
