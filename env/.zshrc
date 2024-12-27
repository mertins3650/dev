export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:$HOME/.local/kitty.app/bin
export PATH=$PATH:$HOME/dev/

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# bun completions
[ -s "/home/simon/.bun/_bun" ] && source "/home/simon/.bun/_bun"
export PATH=$PATH:$HOME/.local/bin

# zoxide
alias cd="z"
eval "$(zoxide init zsh)"
# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
export PATH="$PATH:~"
export PATH="$PATH:$HOME/scripts"
export PATH=$PATH:/usr/local/bin
export PATH="$HOME:$PATH"


# Generated for envman. Do not edit.
#
#
#
#
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


# Add Cargo's bin directory to PATH
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim


# eza
export FPATH="<path_to_eza>/completions/zsh:$FPATH"
alias ls="eza -1 --group-directories-first --icons"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PATH=$HOME/.local/bin:$PATH
alias qmkenv="source ~/.venvs/qmk/bin/activate"
alias qmkcompile="qmk compile -kb lily58/rev1 -km lily58_qmk -e CONVERT_TO=promicro_rp2040"

