autoload -Uz compinit && compinit

setopt PROMPT_SUBST

export EDITOR="emacsclient --socket-name=emacs --tty"
export FZF="/etc/profile.d"
export VISUAL="emacsclient --socket-name=emacs --create-frame"
export ZSH="/home/flaviogf/.oh-my-zsh"

if [[ -f "${ZSH}/oh-my-zsh.sh" ]]; then
    source $ZSH/oh-my-zsh.sh
fi

if [[ -f "${FZF}/fzf.zsh" ]]; then
    source $FZF/fzf.zsh
fi

if [[ -z "$TMUX" ]]; then
    tmux new-session -A -s console
fi

plugins=(
    asdf
    docker
    docker-compose
    git
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

alias find="fd"
alias grep="rg"
alias ls="exa"
alias ll="exa -aghl --group-directories-first --icons"

eval "$(starship init zsh)"
