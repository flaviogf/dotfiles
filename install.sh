#!/usr/bin/env bash

DOTFILES="/home/flaviogf/dev/dotfiles"

# Alacritty
ln -sf "${DOTFILES}/alacritty/.alacritty.yml" "${HOME}/.alacritty.yml"

# Emacs
mkdir -p "${HOME}/.emacs.d" && ln -sf "${DOTFILES}/emacs/init.el" "${HOME}/.emacs.d/init.el"

# Fish
mkdir -p "${HOME}/.config/fish" && ln -sf "${DOTFILES}/fish/config.fish" "${HOME}/.config/fish/config.fish"

# Git
ln -sf "${DOTFILES}/git/.gitconfig" "${HOME}/.gitconfig"

# I3
mkdir -p "${HOME}/.config/i3" && ln -sf "${DOTFILES}/i3/config" "${HOME}/.config/i3/config" && \

# Neovim
mkdir -p "${HOME}/.config/nvim" && ln -sf "${DOTFILES}/nvim/init.lua" "${HOME}/.config/nvim/init.lua"

# Picom
mkdir -p "${HOME}/.config/picom" && ln -sf "${DOTFILES}/picom/picom.conf" "${HOME}/.config/picom/picom.conf"

# Polybar
mkdir -p "${HOME}/.config/polybar" && \
    ln -sf "${DOTFILES}/polybar/config.ini" "${HOME}/.config/polybar/config.ini" && \
    ln -sf "${DOTFILES}/polybar/launch.sh" "${HOME}/.config/polybar/launch.sh"

# Qutebrowser
mkdir -p "${HOME}/.config/qutebrowser/bookmarks" && \
    ln -sf "${DOTFILES}/qutebrowser/config.py" "${HOME}/.config/qutebrowser/config.py" && \
    ln -sf "${DOTFILES}/qutebrowser/quickmarks" "${HOME}/.config/qutebrowser/quickmarks" && \
    ln -sf "${DOTFILES}/qutebrowser/bookmarks/urls" "${HOME}/.config/qutebrowser/bookmarks/urls"

# Starship
ln -sf "${DOTFILES}/starship/starship.toml" "${HOME}/.config/starship.toml"

# Tmux
ln -sf "${DOTFILES}/tmux/.tmux.conf" "${HOME}/.tmux.conf"

# Xorg
ln -sf "${DOTFILES}/xorg/.xinitrc" "${HOME}/.xinitrc"

# Zsh
ln -sf "${DOTFILES}/zsh/.zshrc" "${HOME}/.zshrc"
