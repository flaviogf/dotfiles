autoload -Uz compinit && compinit

set -o vi

setopt PROMPT_SUBST

export ZSH="/home/flaviogf/.oh-my-zsh"

export ZSH_TMUX_AUTOSTART="true"
export ZSH_TMUX_DEFAULT_SESSION_NAME="console"

export EDITOR="emacsclient --socket-name=emacs --tty"
export FZF="/etc/profile.d"
export VISUAL="emacsclient --socket-name=emacs --create-frame"

plugins=(
    asdf
    docker
    docker-compose
    git
    tmux
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
[ -f $FZF/fzf.zsh ] && source $FZF/fzf.zsh

alias find="fd"
alias grep="rg"
alias ls="exa"
alias ll="exa -aghl --group-directories-first --icons"

eval "$(starship init zsh)"
