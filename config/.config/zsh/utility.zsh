# -->>> Python -->>>
#source "${HOME}/.venv/bin/activate"
# <<<-- Python <<<--

# -->>> Anaconda-->>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ellio/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ellio/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ellio/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ellio/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<<-- Anaconda <<<--

# -->>> McFly  -->>>
#eval "$(mcfly init zsh)"
#source /usr/share/doc/mcfly/mcfly.zsh
#export MCFLY_RESULTS=200
# <<<-- McFly  <<<--


# -->>> AutoJump  -->>>
source /usr/share/autojump/autojump.zsh
# <<<-- AutoJump  <<<--


# -->>> Nested Ranger Notice -->>>
source "${HOME}/.config/ranger/plugins/shell_subshell_notice.sh"
# <<<-- Nested Ranger Notice <<<--


# -->>> FASD  -->>>
#fasd_cache="$XDG_CACHE_HOME/.fasd-init-zsh"

#if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
#    fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install >| "$fasd_cache"
#    sed -i '/alias sd.*/d' $XDG_CACHE_HOME/.fasd-init-zsh
#fi
#source "$fasd_cache"
#unset fasd_cache
# <<<-- FASD  <<<--
