autoload -Uz compinit && compinit

export EDITOR="emacsclient --socket-name=emacs --tty"
export FZF="/etc/profile.d"
export VISUAL="emacsclient --socket-name=emacs --create-frame"
export ZSH="/home/flaviogf/.oh-my-zsh"

plugins=(
    asdf
    docker
    docker-compose
    git
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

neofetch
