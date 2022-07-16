#!/usr/bin/env bash
set -eu
set -o xtrace
loadkeys us

decrypt(){
    openssl enc -aes-256-cbc -a -A -d -md sha512 -pbkdf2 -iter 250000 -salt $@
}

url='https://github.com/runtankrun/dotfiles/raw/dev/alis/alis.tar.gz'
curl -L -O $url

tar -xvf alis.tar.gz
chmod +x configs/*.sh
chmod +x *.sh

decrypt -in alis.dat -out alis.conf
