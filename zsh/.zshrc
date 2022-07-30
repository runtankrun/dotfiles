figlet -f ~/.fonts/misc/figlet/Rectangles.flf 'TANK'

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
# <<<-- THEME <<<--

# -->>> PLUGINS -->>>
plugins=(
        zsh-syntax-highlighting 
        zsh-history-substring-search 
        zsh-autosuggestions
        ) 
# <<<-- PLUGINS <<<--

source $ZSH/oh-my-zsh.sh

# -->>> Define Color Variables  -->>>
. ${HOME}/.scripts/colors/getcolors
# <<<-- Define Color Variables <<<--

source "${HOME}/.config/ranger/plugins/shell_subshell_notice.sh"
source "${HOME}/.scripts/c-env"

#################
#   FUNCTIONS   #
#################
## -->>> SSH  -->>>
SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}
# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
# <<<-- SSH  <<<--


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
    git remote set-url origin git@github.com:runtankrun/$1.git; 
    git push -u origin main
}

gpsh() {
    git add .
    
    if [[ "$#" -eq 0 ]]; then
        comment="minor updates"
    else
        comment="$@"
    fi

    git commit -m "$comment";
    git push origin master
}

gitCloneFromBrowser(){
    sleep 1s;
    
    xdotool key ctrl+l; sleep 1s;
    xdotool key ctrl+c; sleep 1s;
    
    url="$(xclip -out -selection primary)"
    file="$(echo "$url" | cut -d "/" -f4-5)"
 
    kitty --name "k-git" --title "k-git" -e sh -c \
        "cd "$HOME"/dev ; git clone $url $file"
}
# <<<--GIT <<<--


# -->>> STORAGE -->>>
storage() {
    df -h | rg -e "/dev/sd[a-z][1-9]" -e "Filesystem"
}
# <<<-- STORAGE <<<--


# -->>> CPU TEMP -->>>
brr() {
        figlet -f ~/.fonts/misc/figlet/ANSI_Shadow.tlf $(echo $(temp))
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


# -->>> Last Backup -->>>
rewind(){
    dir=$(ls -d /mnt/PSSD/timeshift/snapshots/* | tail -n1)
    ranger $dir/localhost$HOME/
}
# <<<-- Last Backup  <<<--


# -->>> FFMPEG Concat -->>>
remux-concat(){                                    
        files=($@)
        tmpDir=$(mktemp -d "${TMPDIR:-/tmp/}$(basename $0).XXXXXXXXXXXX")
        timeStamp=$(date "+%Y%m%d-%H%M%S%3N")
        
        touch $tmpDir/vidlist.txt

        for f in $files
        do
                echo "file '$f'" >> $tmpDir/vidlist.txt
        done

        ffmpeg -f concat -safe 0 -i $tmpDir/vidlist.txt -c copy $(output_$timeStamp).mp4
}
# <<<-- FFMPEG Concat <<<--


# -->>> GREP BETWEEN  -->>>
gb(){
   grep -o -P "(?<=$1).*(?=$2)"
}
# <<<-- GREP BETWEEN  <<<--

# -->>> RANGER  -->>>
fm() {
    source ranger
}
# <<<-- RANGER  <<<--


# -->>> McFly  -->>>
eval "$(mcfly init zsh)"
source /usr/share/doc/mcfly/mcfly.zsh
export MCFLY_RESULTS=200
# <<<-- McFly  <<<--


# -->>> AutoJump  -->>>
source /usr/share/autojump/autojump.zsh
# <<<-- AutoJump  <<<--


# >>> conda initialize >>>
#__conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
#        . "/opt/anaconda/etc/profile.d/conda.sh"
#    else
#        export PATH="/opt/anaconda/bin:$PATH"
#    fi
#fi
#unset __conda_setup
#conda activate bdfr
# <<< conda initialize <<<

# -->>> FASD -->>>
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache
# <<<-- FASD <<<--


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh || source ~/.oh-my-zsh/custom/prompt.zsh


export MPV_SOCKET_DIR="$HOME/Videos/MPV_Socket"

