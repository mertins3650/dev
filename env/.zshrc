export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"
setopt HIST_IGNORE_ALL_DUPS

# Aliases
alias ls="eza -1 --group-directories-first --icons"
alias cd="z"
alias ndev="nix develop -c \$SHELL"
alias qmklily="qmk compile -kb lily58/rev1 -km lily58_qmk -e CONVERT_TO=rp2040_ce"
alias qmkiris="qmk compile -kb keebio/iris/rev8 -km iris_qmk"
alias qmkupdate="git pull origin master"
alias zenup="nh os switch -H zenbook"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"
export PATH="$HOME/:$PATH"
eval "$(zoxide init zsh)"

