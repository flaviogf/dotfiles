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
    tmuxinator
)

source $ZSH/oh-my-zsh.sh

source $HOME/.fzf.zsh

SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_SYMBOL="➤"
SPACESHIP_USER_SHOW=always
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_GCLOUD_SHOW=false

autoload -Uz compinit && compinit

export EDITOR=vim

export FZF_DEFAULT_COMMAND='fdfind -H -E .git -t f'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
