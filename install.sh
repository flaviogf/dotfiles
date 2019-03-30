# git
echo "Instalando git"
apt install git -y

# neovim
echo "Instalando neovim"
apt install neovim -y

# zsh
echo "Instalando zsh"
apt install zsh -y

echo "Configurando zsh"
chsh -s /bin/zsh

# oh-my-zsh
echo "Instalando oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Instalando plugins zsh"
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# chromium
echo "Instalando chromium"
snap install chromium

# tmux
echo "Instalando tmux"
snap install tmux --classic
