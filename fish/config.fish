set fish_greeting

set -Ux VISUAL "emacsclient --socket-name=emacs --create-frame"
set -Ux EDITOR "nvim"

. $HOME/.asdf/asdf.fish

alias df="df -h"

alias find="fd"

alias free="free -m"

alias grep="rg"

alias la="exa --all --group-directories-first --icons"
alias ll="exa --long --group-directories-first --icons"
alias ls="exa --all --group --header --long --group-directories-first --icons"
alias lt="exa --all --tree --group-directories-first --icons"

alias emacs="emacsclient --socket=emacs --tty"
alias vi="nvim"
alias vim="nvim"

starship init fish | source