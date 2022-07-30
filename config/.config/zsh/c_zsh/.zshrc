figlet -f ~/.fonts/misc/figlet/Rectangles.flf 'TANK'
# Enable Powerlevel10k instant prompt. 
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

while read file
do 
  source "$ZDOTDIR/c_$file.zsh"
done <<-EOF
theme
env
alias
utility
functions
EOF
