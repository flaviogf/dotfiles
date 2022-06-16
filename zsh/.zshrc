autoload -Uz compinit && compinit

export ZSH="/home/flaviogf/.oh-my-zsh"
export FZF="/etc/profile.d"

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

eval "$(starship init zsh)"

neofetch
