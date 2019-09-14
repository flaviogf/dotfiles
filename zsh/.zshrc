export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="kafeitu"

DISABLE_AUTO_TITLE="true"

COMPLETION_WAITING_DOTS="true"

plugins=(
	git
	zsh-completions
	zsh-syntax-highlighting
        zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
