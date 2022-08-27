#!/bin/sh

set -eu
set -o xtrace

decrypt(){
    openssl enc -aes-256-cbc -a -A -d -md sha512 -pbkdf2 -iter 250000 -salt $@
}

url='https://github.com/runtankrun/dotfiles/releases/download/v0.0.1/install.tar.gz'
curl -sL -O $url

tar -xzvf install.tar.gz
chmod +x configs/*.sh
chmod +x *.sh

decrypt -in alis.dat -out alis.conf
