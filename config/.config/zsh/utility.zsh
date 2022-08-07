# -->>> McFly  -->>>
eval "$(mcfly init zsh)"
source /usr/share/doc/mcfly/mcfly.zsh
export MCFLY_RESULTS=200
# <<<-- McFly  <<<--


# -->>> AutoJump  -->>>
source /usr/share/autojump/autojump.zsh
# <<<-- AutoJump  <<<--


# -->>> Nested Ranger Notice -->>>
source "${HOME}/.config/ranger/plugins/shell_subshell_notice.sh"
# <<<-- Nested Ranger Notice <<<--


# -->>> FASD  -->>>
fasd_cache="$XDG_CACHE_HOME/.fasd-init-zsh"

if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install >| "$fasd_cache"
fi

source "$fasd_cache"
unset fasd_cache
# <<<-- FASD  <<<--


export MPV_SOCKET_DIR="$HOME/Videos/MPV_Socket"
