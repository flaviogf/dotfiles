# git
echo "Instalando git"
apt install git -yq

# neovim
echo "Instalando neovim"
apt install neovim -yq

# zsh
echo "Instalando zsh"
apt install zsh -yq
echo "Configurando zsh"
chsh -s /bin/zsh

# oh-my-zsh
echo "Instalando oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# chromium
echo "Instalando chromium"
snap install chromium

# vscode
echo "Instalando vscode"
snap install vscode --classic

# tmux
echo "Instalando tmux"
snap install tmux --classic
