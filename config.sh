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
	local = ARQUIVO="$HOME/.zshrc"
	local URL="https://raw.githubusercontent.com/flaviogf/dotfiles/master/zsh/.zshrc"
	curl -fLo $ARQUIVO --create-dirs $URL
}

vim_plug
init_vim
zshrc
