#!/usr/bin/env sh

export C_BDFR=/run/media/ellio/T7/bdfr
export C_HOME=${HOME}/.scripts

export HISTFILE="$ZDOTDIR"/.zsh_history
export SUDO_PROMPT="passwd: "
export TERMINAL="kitty"
export BROWSER="firefox"
export VISUAL="vim"
export EDITOR="vim"
    
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$XDG_DATA_HOME/flatpak/exports/share"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export GOPATH="$XDG_DATA_HOME"/go
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME"/nv
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export POETRY_HOME="$XDG_DATA_HOME"/poetry
export KERAS_HOME="${XDG_STATE_HOME}/keras"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup


