#!/usr/bin/env bash

DOTFILES="/home/flaviogf/dev/dotfiles"

# Alacritty
ln -sf "${DOTFILES}/alacritty/.alacritty.yml" "${HOME}/.alacritty.yml"

# Emacs
mkdir -p "${HOME}/.emacs.d" && ln -sf "${DOTFILES}/emacs/init.el" "${HOME}/.emacs.d/init.el"

# Dunst
mkdir -p "${HOME}/.config/dunst" && ln -sf "${DOTFILES}/dunst/dunstrc" "${HOME}/.config/dunst/dunstrc"

# Picom
mkdir -p "${HOME}/.config/picom" && ln -sf "${DOTFILES}/picom/picom.conf" "${HOME}/.config/picom/picom.conf"

# Starship
ln -sf "${DOTFILES}/starship/starship.toml" "${HOME}/.config/starship.toml"

# Tmux
ln -sf "${DOTFILES}/tmux/.tmux.conf" "${HOME}/.tmux.conf"

# Vim
ln -sf "${DOTFILES}/vim/.vimrc" "${HOME}/.vimrc"

# Xmobar
ln -sf "${DOTFILES}/xmobar/.xmobarrc" "${HOME}/.xmobarrc"

# Xmonad
mkdir -p "${HOME}/.xmonad" && ln -sf "${DOTFILES}/xmonad/xmonad.hs" "${HOME}/.xmonad/xmonad.hs"

# Xorg
ln -sf "${DOTFILES}/xorg/.xinitrc" "${HOME}/.xinitrc"

# Zsh
ln -sf "${DOTFILES}/zsh/.zshrc" "${HOME}/.zshrc"
