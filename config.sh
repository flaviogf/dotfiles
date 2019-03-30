# neovim
vim_plug() {
	local ARQUIVO="$HOME/.local/share/nvim/site/autoload/plug.vim"
	local URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	curl -fLo $ARQUIVO --create-dirs $URL
}

init_vim() {
	local ARQUIVO="$HOME/.config/nvim/init.vim"
	local URL="https://raw.githubusercontent.com/flaviogf/dotfiles/master/nvim/init.vim"
	curl -fLo $ARQUIVO --create-dirs $URL
}

# zshrc
zshrc() {
	local ARQUIVO="$HOME/.zshrc"
	local URL="https://raw.githubusercontent.com/flaviogf/dotfiles/master/zsh/.zshrc"
	curl -fLo $ARQUIVO --create-dirs $URL
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
}

vim_plug
init_vim
zshrc
