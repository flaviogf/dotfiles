export ZSH="/home/`whoami`/.oh-my-zsh"

ZSH_THEME="spaceship"

COMPLETION_WAITING_DOTS="true"

plugins=(
    asdf
    docker
    docker-compose
    docker-machine
    git
    gitignore
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

source $HOME/.fzf.zsh

SPACESHIP_CHAR_SYMBOL="➤"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_USER_SHOW=always

autoload -Uz compinit && compinit

export PATH="$PATH:$(yarn global bin)"

export FZF_DEFAULT_COMMAND='fdfind -H -E .git -t f'
