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
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	local ARQUIVO="$HOME/.zshrc"
	local URL="https://raw.githubusercontent.com/flaviogf/dotfiles/master/zsh/.zshrc"
	curl -fLo $ARQUIVO --create-dirs $URL
	git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
}

config_vim_plug
config_nvim
config_zsh
