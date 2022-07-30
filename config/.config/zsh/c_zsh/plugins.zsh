source ~/.zplug/init.zsh

zplug "jgogstad/passwordless-history", from:github
zplug "MichaelAquilina/zsh-you-should-use", from:github
zplug "Aloxaf/fzf-tab", from:github


zplug "zsh-users/zsh-autosuggestions", from:github
zplug "zsh-users/zsh-history-substring-search", from:github
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:2

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load #--verbose
