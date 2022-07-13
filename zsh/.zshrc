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
ZSH_THEME="random"
# <<<-- THEME <<<--

# -->>> PLUGINS -->>>
plugins=(themes zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search) 
# <<<-- PLUGINS <<<--

source $ZSH/oh-my-zsh.sh

# -->>> Define Color Variables  -->>>
. ${HOME}/.scripts/colors/getcolors
# <<<-- Define Color Variables <<<--

#################
#   FUNCTIONS   #
#################
# -->>> QUICK ALIAS -->>>
qa() {
    
    alias=echo "alias $1='$2'" >> $HOME/.oh-my-zsh/custom/alias.zsh
}
# <<<-- QUICK ALIAS <<<--

# -->>> BSPWM Gaps -->>>
gaps() {
         while getopts g:h:v: option
         do
                case "${option}"
                        in
                        h)horizontal=${OPTARG};;
                        g)gaps=${OPTARG};;
                        v)vertical=${OPTARG}
                esac
        done
        bspc config -m focused left_padding "$horizontal" &
        bspc config -m focused right_padding "$horizontal" &
        bspc config -m focused top_padding "$vertical" &
        bspc config -m focused bottom_padding "$vertical" &
        bspc config -m focused window_gap "$gaps"
}
# <<<-- BSPWM Gaps <<<--

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

fm() {
    source ranger
}

# -->>> Last Backup -->>>
rewind(){
    dir=$(ls -d /mnt/PSSD/timeshift/snapshots/* | tail -n1)
    ranger $dir/localhost/home/ellio/
}
# <<<-- Last Backup  <<<--

# -->>> FFMPEG Concat -->>>
remux-concat(){                                    
        files=($@)
        echo "" > ~/Documents/vidlist.txt

        for f in $files
        do
                echo "file '$f'" >> ~/Documents/vidlist.txt
        done

        ffmpeg -f concat -safe 0 -i ~/Documents/vidlist.txt -c copy $(tfn).mp4
}
# <<<-- FFMPEG Concat <<<--

gb(){
   grep -o -P "(?<=$1).*(?=$2)"
}

# -->>> XRDM settings -->>>
export XRDM_DIR=~/.Xresource.d
export XRDM_FONT_DIR=$XRDM_DIR/fonts
export XRDM_COLOR_DIR=$XRDM_DIR/colors
export XRDM_PRESET_DIR=$XRDM_DIR/presets
export XRDM_PROGRAM_DIR=$XRDM_DIR/programs
source xrdm
# <<<-- XRDM settings <<<--

# -->>> McFly  -->>>
eval "$(mcfly init zsh)"
source /usr/share/doc/mcfly/mcfly.zsh
export MCFLY_RESULTS=50
# <<<-- McFly  <<<--

# -->>> AutoJump  -->>>
. /usr/share/autojump/autojump.zsh
# <<<-- AutoJump  <<<--
    
# >>> conda initialize >>>
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
conda activate bdfr
# <<< conda initialize <<<
#
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh || source ~/.oh-my-zsh/custom/prompt.zsh

##FASD
if (( ! ${+commands[fasd]} )); then
  return
fi

fasd_cache="${ZSH_CACHE_DIR}/fasd-init-cache"
if [[ "$commands[fasd]" -nt "$fasd_cache" || ! -s "$fasd_cache" ]]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install \
    zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache
