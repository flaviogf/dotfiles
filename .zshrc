export ZSH="/home/flaviogf/.oh-my-zsh"

ZSH_THEME="half-life"

COMPLETION_WAITING_DOTS="true"

plugins=(
    asdf
    git
    yarn
    zsh-completions
    zsh-syntax-highlighting
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

export NODEJS_CHECK_SIGNATURES=no
export PATH="$(yarn global bin):$PATH"
