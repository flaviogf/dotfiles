export ZSH="/home/flaviogf/.oh-my-zsh"

ZSH_THEME="spaceship"

COMPLETION_WAITING_DOTS="true"

plugins=(
    asdf
    docker
    docker-compose
    git
    gitignore
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_USER_SHOW=always

autoload -Uz compinit && compinit
