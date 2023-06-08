#!/bin/bash
set -e

clear

working_dir='installation_files'
url='https://github.com/runtankrun/dotfiles/releases/download/v0.0.2/install.tar.gz'

echo -e "\e[32m============================================"
echo -e "\e[32mWelcome to the Ultra-Smooth Installation Kit"
echo -e "\e[32m============================================\e[0m"
echo "Let's get started with setting up your environment!"

password_setup(){
  echo "Create a secure $1 password:"
  read -s password
  echo

  echo "Confirm your $1 password:"
  read -s password_confirm
  echo

  if [ "$password" != "$password_confirm" ]; then
    echo -e "\e[31mThe passwords do not match. Re-run the script and ensure they match.\e[0m"
    exit 1
  fi

  escaped_password=$(printf '%q' "$password")

  sed -i "s/<$1_PASSWORD>/$escaped_password/g" "$working_dir/alis.conf"
  echo "Password for $1 successfully set up."
}

build(){
  echo "Preparing your working directory..."
  rm -rf "$working_dir" && mkdir "$working_dir"
  echo "Working directory is set."

  echo "Downloading the installation package..."
  curl -sL -O "$url"
  tar -xvf install.tar.gz -C "$working_dir"
  echo "Installation package downloaded and extracted."

  echo "Assigning execute permissions to script files..."
  chmod +x $working_dir/configs/*.sh
  chmod +x $working_dir/*.sh
  echo "Permissions granted."
}

clean(){
  echo "Cleaning up the installation package..."
  rm install.tar.gz
  echo -e "\e[32mInstallation package cleaned up. You're all set.\e[0m"
}

build
password_setup ROOT
password_setup USER
clean
