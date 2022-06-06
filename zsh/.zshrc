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
    kubectl
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    tmuxinator
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source $HOME/.fzf.zsh

DRACULA_ARROW_ICON="➤ "
DRACULA_DISPLAY_CONTEXT=1
DRACULA_DISPLAY_TIME=0

autoload -Uz compinit && compinit

alias vim=nvim
alias vi=nvim

export EDITOR=nvim
export VISUAL=nvim

export FZF_DEFAULT_COMMAND='fd -H -E .git -t f'
