export ZSH="/home/flavio/.oh-my-zsh"

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
export PATH="$PATH:$(yarn global bin)"
export PATH="$PATH:/home/flavio/.dotnet/tools"
export PATH="$PATH:/snap/bin"

autoload -U compinit && compinit
