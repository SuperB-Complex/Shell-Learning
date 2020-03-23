#!/usr/bin/sh
ls >> container.txt
echo "this is the second line that I wrote to this file" >> container.txt
echo 'export PATH="~/.pyenv/bin:$PATH"' >> container.txt
echo 'eval "$(pyenv init -)"' >> container.txt
echo 'eval "$(pyenv virtualenv-init -)"' >> container.txt
