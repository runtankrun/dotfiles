# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# -->>> THEME -->>>
ZSH_THEME="powerlevel10k"
#ZSH_THEME="smt"
#ZSH_THEME="minimal-blackcat"
#ZSH_THEME="random"
# <<<-- THEME <<<--

# -->>> PLUGINS -->>>
plugins=(themes git-open zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search) 
# <<<-- PLUGINS <<<--

source $ZSH/oh-my-zsh.sh

#################
#   FUNCTIONS   #
#################
# -->>> QUICK ALIAS -->>>
qa() {
    echo "alias $1='$2'" >> $HOME/.oh-my-zsh/custom/alias.zsh
}
# <<<-- QUICK ALIAS <<<--

#-->>> GIT -->>>
ginit() {
    echo "# HTML" >> README.md;
    git init; 
    git add .; 
    git commit -m "first commit"; 
    git branch -M main; 
    git remote add origin git@github.com:runtankrun/$1.git ; 
    git remote set-url origin https://github.com/runtankrun/$1.git;
    pass -c git/git_token;sleep .3s;
    git push -u origin main
}

gpsh() {
    echo "$(git branch -a)" 
    echo "Branch: "
    read branch
    echo "Commit Comment: "
    read comment
    git add . ;
    git commit -m "$comment";
    pass -c git/git_token; 
    echo "runtankrun"; 
    git push origin "$branch"
    git-open
}
# <<<--GIT <<<--

# -->>> STORAGE -->>>
storage() {
    df -h | rg -e "/dev/sd[a-z][1-9]" -e "Filesystem"
}
# <<<-- STORAGE <<<--

# -->>> CPU TEMP -->>>
brr() {
        figlet -f ~/.fonts/misc/figlet/future.tlf $(echo $(temp))
}
temp() {
        cat \
        /sys/class/thermal/thermal_zone*/temp | \
        column -s $'\t' -t | \
        sed 's/\(.\)..$/.\1°C/' | \
        tail -n1
}
# <<<-- CPU TEMP <<<--

# -->>> CLEAR ZOMBIE PROCESSES -->>>
clrz() {
    ps -eal | awk '{ if ($2 == "Z") {print $4}}' | kill -9
}
# <<<-- CLEAR ZOMBIE PROCESSES <<<--

# -->>> THEME -->>>
change-theme() {                                            
        theme_name="$(cat .zsh_favlist | shuf | tail -n1)"
        theme "$theme_name"
        echo
        echo "Random theme '"$theme_name"' loaded from .zsh_favlist"
        echo
}
save-theme() {
        if grep -q "$RANDOM_THEME" ~/.zsh_favlist; 
        then
                echo ""$RANDOM_THEME" is already saved"
        else
                echo "$RANDOM_THEME" >> ~/.zsh_favlist
        fi
}
# <<<-- THEME <<<--

# -->>> STOW  -->>>
tlinks-a() {
    cd ${HOME}/dotfiles ;
    for dir in *; do                         
            echo "# -->>> $dir -->>>" | lolcat  
            tlinks "$dir"                      
            echo "# <<<-- $dir <<<--\n" | lolcat
    done
}
# <<<-- STOW  <<<--

fm() {
        source ~/.scripts/ranger/ranger-slim
}

ctmp(){ echo "file_$(date +%F_%T | sd ':|-' '')" }

# -->>> conda initialize -->>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
# . "/opt/anaconda/etc/profile.d/conda.sh"  # commented out by conda initialize
    else
# export PATH="/opt/anaconda/bin:$PATH"  # commented out by conda initialize
    fi
fi
unset __conda_setup
# <<<-- conda initialize <<<--

# Begin xrdm settings
export XRDM_DIR=~/.Xresource.d
export XRDM_FONT_DIR=$XRDM_DIR/fonts
export XRDM_COLOR_DIR=$XRDM_DIR/colors
export XRDM_PRESET_DIR=$XRDM_DIR/presets
export XRDM_PROGRAM_DIR=$XRDM_DIR/programs
source xrdm
# End xrdm settings

# Mcfly
eval "$(mcfly init zsh)"
#export MCFLY_FUZZY=1
source /usr/share/doc/mcfly/mcfly.zsh
export MCFLY_RESULTS=50

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#autojump
. /usr/share/autojump/autojump.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

