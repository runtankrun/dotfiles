figlet -f ~/.fonts/misc/figlet/Rectangles.flf 'TANK'
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/c_zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

while read file
do 
  source "$ZDOTDIR/$file.zsh"
done <<-EOF
plugins
theme
env
history
key-bindings
alias
functions
prompt
utility
EOF
