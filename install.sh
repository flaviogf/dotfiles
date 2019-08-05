# build-essential
echo "Installing build-essential"
apt install build-essential -y

# python3
echo "Installing python3"
apt install python3 python3-dev python3-venv -y

# python3.7
echo "Installing python3.7"
apt install python3.7 python3.7-dev python3.7-venv -y

# neovim
echo "Installing neovim"
apt install neovim -y

# zsh
echo "Installing zsh"
apt install zsh -y

# chromium
echo "Installing chromium"
snap install chromium

# tmux
echo "Installing tmux"
snap install tmux --classic

# vscode
echo "Installing vscode"
snap install code --classic

