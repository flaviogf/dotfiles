export ZSH="/home/flaviogf/.oh-my-zsh"

ZSH_THEME="spaceship"

COMPLETION_WAITING_DOTS="true"

plugins=(
    docker
    docker-compose
    git
    gitignore
)

source $ZSH/oh-my-zsh.sh

SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_USER_SHOW=always

autoload -U compinit && compinit
