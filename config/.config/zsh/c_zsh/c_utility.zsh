# -->>> PLUGINS -->>>
plugins=(themes zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search) 
# <<<-- PLUGINS <<<--

source $ZSH/oh-my-zsh.sh

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

export MPV_SOCKET_DIR="$HOME/Videos/MPV_Socket"
