set EDITOR "emacsclient --socket-name=emacs --tty"
set VISUAL "emacsclient --socket-name=emacs --create-frame"

. $HOME/.asdf/asdf.fish

alias find="fd"

alias grep="rg"

alias la="exa --all --group-directories-first --icons"
alias ll="exa --long --group-directories-first --icons"
alias ls="exa --all --group --header --long --group-directories-first --icons"
alias lt="exa --all --tree --group-directories-first --icons"

alias vi="nvim"
alias vim="nvim"


starship init fish | source