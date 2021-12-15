alias vi="nvim"
alias vim="nvim"
alias g="git"

PS1="λ "

export PYTHONPATH="/usr/local/bin/python3"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#9c9c9c"

# evaluate fnm
export PATH="/var/folders/bx/ynstdclx65g5wtkh158_6tl40000gn/T/fnm_multishells/12789_1632434466906/bin":$PATH
export FNM_MULTISHELL_PATH="/var/folders/bx/ynstdclx65g5wtkh158_6tl40000gn/T/fnm_multishells/12789_1632434466906"
export FNM_DIR="/Users/diogomafra/.fnm"
export FNM_LOGLEVEL="info"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_ARCH="x64"

# git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
