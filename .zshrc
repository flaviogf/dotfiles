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

source $HOME/.asdf/plugins/java/set-java-home.zsh
source $ZSH/oh-my-zsh.sh

export NODEJS_CHECK_SIGNATURES=no
export PATH="$(yarn global bin):$PATH"
export PATH="/snap/bin:$PATH"

autoload -U compinit && compinit
