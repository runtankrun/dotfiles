# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/ellio/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
#ZSH_CUSTOM=/home/ellio/.oh-my-zsh/

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#grep arguments
alias mpvt='mpv $(grep ^$: ~/.config/ranger/tagged | tail -n 1 | tail -c +3)'

#Git
alias gi='git init'
alias gs='git status'
alias ga='git add -A'
alias gc='git commit -m'
alias gpsh='git push -u origin master'
alias gpll='git pull'
alias dotg='cd ~/dotfiles/; git status'

#stow
alias tlinks='stow --adopt -nv'
alias clinks='stow --adopt -v'

#ProtonVPN
alias prof='sudo protonvpn c -f'
alias pros='sudo protonvpn c --sc'
alias pror='protonvpn refresh' 

#Polybar
alias poly='~/.config/polybar/launch.sh'

#GPU
alias gpu='watch -d -n 0.5 nvidia-smi'

#tty-clock
alias tm='tty-clock -c -x -t'

#feh image
alias pic='feh --scale-down --auto-zoom'
alias pic-ss='feh -Z -. -D 5'

#Feh background (2 monitors)
alias wp='feh --bg-fill ~/.config/wall.png --bg-fill ~/.config/wall2.png'
alias wpc='feh --bg-fill ~/.config/wall.png --bg-fill ~/.config/wall2.png; wal -n -i ~/.config/wall.png -a 90'
alias tt='wal -n -i ~/.config/wall.png -a'

#Neofetch
alias nf='neofetch'

#Colors
alias col='cb-small;colorpanes;colorline'

#refresh bash
alias rb='source ~/.bashrc'
alias rz='source ~/.zshrc'

#fix terminal
alias fixur='xrdb ~/.Xresources'

#Openbox Window Identifier
alias win='obxprop | grep "^_OB_APP"'

#CLI Music
alias music='ncmpcpp'
alias music2='~/.ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueberzug'

#Ranger
alias fm='ranger'

#Font Cache Refresh
alias rf='fc-cache -f -v'
alias fl='fc-list | grep "~/.fonts/"'

#Youtube-DL
alias yd='youtube-dl --restrict-filenames'
alias ydm='youtube-dl --extract-audio --embed-thumbnail --audio-format mp3'
alias ydb='cd ~/Videos/yd/; youtube-dl --batch-file=~/Videos/yd/yd'
#vim
alias vim-s='vim -S ~/.vim/sessions/main.vim'

#Figlet
alias yo='figlet -f ~/.fonts/misc/figlet/3D-ASCII.flf'
alias yo2='figlet -f ~/.fonts/misc/figlet/isometric.flf'

#Shred
alias shreddit='shred -n 5 -v -z'

#XRDM
alias cs='xrdm color'
alias tf='xrdm font'

#timeshift
alias bu='sudo timeshift --create --comments'
alias bun='sudo timeshift --create --comments "housekeeping"'
alias bul='sudo timeshift --list'
alias bud='sudo timeshift --delete --snapshot'
alias bus='sudo timeshift --create --comments "stable"'

# Begin xrdm settings
export XRDM_DIR=~/.Xresource.d
export XRDM_FONT_DIR=$XRDM_DIR/fonts
export XRDM_COLOR_DIR=$XRDM_DIR/colors
export XRDM_PRESET_DIR=$XRDM_DIR/presets
export XRDM_PROGRAM_DIR=$XRDM_DIR/programs

source xrdm
# End xrdm settings
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
