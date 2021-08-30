export ZSH="/home/`whoami`/.oh-my-zsh"

ZSH_THEME="dracula"

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

DRACULA_ARROW_ICON="➤ "
DRACULA_DISPLAY_CONTEXT=1
DRACULA_DISPLAY_TIME=0

autoload -Uz compinit && compinit

export EDITOR=vim

export FZF_DEFAULT_COMMAND='fd -H -E .git -t f'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
