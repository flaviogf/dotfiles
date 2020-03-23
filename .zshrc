export ZSH="/home/flaviogf/.oh-my-zsh"

ZSH_THEME="spaceship"

COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte-2.91.sh
fi

export NODEJS_CHECK_SIGNATURES=no

export PATH="$(yarn global bin):$PATH"
