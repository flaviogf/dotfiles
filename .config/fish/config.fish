fish_add_path ~/.local/bin

set fish_greeting

set -x DOCKER_BUILDKIT 1
set -x EDITOR "nvim"
set -x GPG_TTY $(tty)
set -x VISUAL "nvim"

alias cat="batcat"
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

for i in ~/.asdf/asdf.fish ~/dev/google-cloud-sdk/path.fish.inc
  if test -f $i; source $i; end
end
