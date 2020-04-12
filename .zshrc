export ZSH="/home/flaviogf/.oh-my-zsh"

ZSH_THEME="spaceship"

COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

export PATH="$(yarn global bin):$PATH"
export JAVA_HOME=$(asdf where java)
export NODEJS_CHECK_SIGNATURES=no

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte-2.91.sh
fi
