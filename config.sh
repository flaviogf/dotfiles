# neovim
config_vim_plug() {
	local ARQUIVO="$HOME/.local/share/nvim/site/autoload/plug.vim"
	local URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	curl -fLo $ARQUIVO --create-dirs $URL
}

config_nvim() {
	local ARQUIVO="$HOME/.config/nvim/init.vim"
	local URL="https://raw.githubusercontent.com/flaviogf/dotfiles/master/nvim/init.vim"
	curl -fLo $ARQUIVO --create-dirs $URL
}

# zsh
config_zsh() {
	local ARQUIVO="$HOME/.zshrc"
	local URL="https://raw.githubusercontent.com/flaviogf/dotfiles/master/zsh/.zshrc"
	curl -fLo $ARQUIVO --create-dirs $URL
	git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
}

# tmux
config_tmux() {
	local ARQUIVO="$HOME/.tmux.conf"
	local URL="https://raw.githubusercontent.com/flaviogf/dotfiles/master/tmux/.tmux.conf"
	curl -fLo $ARQUIVO --create-dirs $URL
}

config_vim_plug
config_nvim
config_zsh
config_tmux

