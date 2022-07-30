# -->>> THEME -->>>
fav_themes(){
    cat<<EOF
frontcube
fwalch
gallois
afowler
candy
dallasx
half-life
mikeh
flazz
bira
pygman
minimal-blackcat
jonathan
smt
dogenpunk
mlh
gnzh
cypher
josh  
miloshadzic
EOF
}

themes=($(fav_themes))
total_themes=$(fav_themes | wc -l)

#ZSH_THEME="${themes[$(( $RANDOM % $total_themes ))]}"
ZSH_THEME="powerlevel10k"
# <<<-- THEME <<<-    


# -->>> Define Color Variables-->>>
. ${HOME}/.scripts/colors/getcolors
# <<<-- Define Color Variables <<<--


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh || source ~/.oh-my-zsh/custom/prompt.zsh
