source ~/.zplug/init.zsh

zplug "jgogstad/passwordless-history", from:github
zplug "romkatv/powerlevel10k", as:theme, depth:1

## String Search
zplug "zsh-users/zsh-autosuggestions", from:github
zplug "zsh-users/zsh-history-substring-search", from:github
zplug "Aloxaf/fzf-tab", from:github

## nohup Keybind
zplug "micrenda/zsh-nohup", from:github

## Syntax Highlighting
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:2

## Install if not found
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load #--verbose
