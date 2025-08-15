export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export DEV_ENV="$HOME/dev"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"
setopt HIST_IGNORE_ALL_DUPS

# Aliases
alias ls='eza -lh --group-directories-first --icons=auto'
alias cd="z"
alias ndev="nix develop -c \$SHELL"
alias qmklily="qmk compile -kb lily58/rev1 -km lily58_qmk -e CONVERT_TO=rp2040_ce"
alias qmkiris="qmk compile -kb keebio/iris/rev8 -km iris_qmk"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"
export PATH="$HOME/:$PATH"
eval "$(zoxide init zsh)"
if command -v mise &> /dev/null; then
    eval "$(mise activate zsh)"
fi

eval "$(mise activate zsh)"
