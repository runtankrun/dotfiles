# Special
background='#1a1b26'
foreground='#a9b1d6'
cursor='#c0caf5'
# Colors
color0='#282c34'
color1='#f7768e'
color2='#73daca'
color3='#e0af68'
color4='#7aa2f7'
color5='#bb9af7'
color6='#7dcfff'
color7='#c0caf5'
color8='#414868'
color9='#f7768e'
color10='#73daca'
color11='#e0af68'
color12='#7aa2f7'
color13='#bb9af7'
color14='#7dcfff'
color15='#c0caf5'

# FZF colors
export FZF_DEFAULT_OPTS="
    $FZF_DEFAULT_OPTS
    --color fg:4,bg:8,hl:1,fg+:232,bg+:4,hl+:255
    --color info:2,prompt:2,spinner:1,pointer:232,marker:1
"

# Fix LS_COLORS being unreadable.
export LS_COLORS="${LS_COLORS}:su=30;41:ow=30;42:st=30;44:"

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# -->>> Define Color Variables-->>>
. ${HOME}/.scripts/colors/getcolors
# <<<-- Define Color Variables <<<--

