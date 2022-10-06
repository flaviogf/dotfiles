#!/usr/bin/env bash

DOTFILES="${HOME}/dev/dotfiles"

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
    mkdir -p "${HOME}/.config/polybar/scripts" && \
    ln -sf "${DOTFILES}/polybar/config.ini" "${HOME}/.config/polybar/config.ini" && \
    ln -sf "${DOTFILES}/polybar/launch.sh" "${HOME}/.config/polybar/launch.sh" && \
    ln -sf "${DOTFILES}/polybar/scripts/pomodoro" "${HOME}/.config/polybar/scripts/pomodoro"

# Starship
ln -sf "${DOTFILES}/starship/starship.toml" "${HOME}/.config/starship.toml"

# Xorg
ln -sf "${DOTFILES}/xorg/.xinitrc" "${HOME}/.xinitrc"
