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
# <<<-- THEME <<<-    


# -->>> Define Color Variables-->>>
. ${HOME}/.scripts/colors/getcolors
# <<<-- Define Color Variables <<<--

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/c_zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/c_zsh/.p10k.zsh ]] || source ~/.config/zsh/c_zsh/.p10k.zsh || source ~/.config/zsh/c_zsh/c_prompt.zsh
