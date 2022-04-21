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

# -->>> COLORS -->>>
xrdb_query()
{
    [ -n "$XRDB_QUERY" ] || XRDB_QUERY="$(xrdb -query)"

    echo "$XRDB_QUERY" | while IFS=';' read -r STRING; do
        [ "${1}" = "${STRING%%\	*}" ] || continue
        echo "${STRING##*\	}"
        break
    done
}
getcolors() {
  FOREGROUND="$(xrdb_query '*.foreground:')"
  BACKGROUND="$(xrdb_query '*.background:')"
  BLACK="$(xrdb_query '*.color0:')"
  RED="$(xrdb_query '*.color1:')"
  GREEN="$(xrdb_query '*.color2:')"
  YELLOW="$(xrdb_query '*.color3:')"
  BLUE="$(xrdb_query '*.color4:')"
  MAGENTA="$(xrdb_query '*.color5:')"
  CYAN="$(xrdb_query '*.color6:')"
  WHITE="$(xrdb_query '*.color7:')"
}
# <<<-- COLORS <<<--

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

git-rollout() {
    read -p 'Branch: ' branch
    read -p 'Commit Comment: ' comment
    git add . ;
    git commit -m "$comment";
    pass -c git/git_token; 
    echo "runtankrun"; 
    git push origin "$branch"
}

gpsh() {
    case $1 in 
        "-m | --master")
            dest="origin master"
        ;;
        "-p | --pages")
            dest="origin gh-pages"
        ;;
        "-h | --help | ''")
            echo "-m | --master \tbranch 'origin master'"
            echo "-p | --pages  \tbranch 'origin gh-pages'"
            echo "-h | --help \t show help"
        ;;
    esac
    
    echo "runtankrun"; 
    pass -c git/git_token; 
    git push $dest
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
        if grep -q "$RANDOM_THEME" ~/.zsh_favlist; then
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

fm() {                                                                        ⏎ [~]
        source ~/.scripts/ranger/ranger-slim
}



# -->>> conda initialize -->>>
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
