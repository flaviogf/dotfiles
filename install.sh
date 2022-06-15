#!/usr/bin/env bash

DOTFILES="/home/flaviogf/dev/dotfiles"

# Alacritty
ln -sf "${DOTFILES}/alacritty/.alacritty.yml" "${HOME}/.alacritty.yml"

# Emacs
mkdir -p "${HOME}/.emacs.d" && ln -sf "${DOTFILES}/emacs/init.el" "${HOME}/.emacs.d/init.el"

# Dunst
mkdir -p "${HOME}/.config/dunst" && ln -sf "${DOTFILES}/dunst/dunstrc" "${HOME}/.config/dunst/dunstrc"

# Neovim
mkdir -p "${HOME}/.config/nvim" && ln -sf "${DOTFILES}/nvim/init.vim" "${HOME}/.config/nvim/init.vim"

# Picom
mkdir -p "${HOME}/.config/picom" && ln -sf "${DOTFILES}/picom/picom.conf" "${HOME}/.config/picom/picom.conf"

# Rofi
mkdir -p "${HOME}/.config/rofi" && ln -sf "${DOTFILES}/rofi/config.rasi" "${HOME}/.config/rofi/config.rasi"

# Tmux
ln -sf "${DOTFILES}/tmux/.tmux.conf" "${HOME}/.tmux.conf"

# Xmonad
mkdir -p "${HOME}/.xmonad" && ln -sf "${DOTFILES}/xmonad/xmonad.hs" "${HOME}/.xmonad/xmonad.hs"

# Xmobar
ln -sf "${DOTFILES}/xmobar/.xmobarrc" "${HOME}/.xmobarrc"

# Zsh
ln -sf "${DOTFILES}/zsh/.zshrc" "${HOME}/.zshrc"