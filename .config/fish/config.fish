set fish_greeting

set -x VISUAL "nvim"
set -x EDITOR "nvim"

alias df="df -h"

alias find="fd"

alias free="free -m"

alias grep="rg"

alias la="exa --all --group-directories-first --icons"
alias ll="exa --long --group-directories-first --icons"
alias ls="exa --all --group --header --long --group-directories-first --icons"
alias lt="exa --all --tree --group-directories-first --icons"

alias vi="nvim"
alias vim="nvim"

starship init fish | source
