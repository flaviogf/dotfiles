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

export SSH_KEY_PATH="~/.ssh/rsa_id"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=1'
