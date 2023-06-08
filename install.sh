#!/bin/sh

set -eu
set -o xtrace

working_dir='installation_files'
url='https://github.com/runtankrun/dotfiles/releases/download/v0.0.2/install.tar.gz'

password_setup(){
        echo "Enter a $1 password:"
        read -s password
        echo

        echo "Confirm your $1 password:"
        read -s password_confirm
        echo

        if [ "$password" != "$password_confirm" ]; then
                echo "Passwords do not match. Please run the script again."
                exit 1
        fi

        escaped_password=$(printf '%q' "$password")

        sed -i "s/<$1_PASSWORD>/$escaped_password/g" installation_files/alis.conf
        cat installation_files/alis.conf | grep $1
}

build(){
    rm -rf "$working_dir" && mkdir "$working_dir"

    curl -sL -O "$url"
    tar -xvf install.tar.gz -C "$working_dir"
    
    chmod +x $working_dir/configs/*.sh
    chmod +x $working_dir/*.sh
}

clean(){
    rm install.tar.gz
}

build
password_setup ROOT
password_setup USER
clean
