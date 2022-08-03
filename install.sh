#!/usr/bin/env bash

DOTFILES="/home/flaviogf/dev/dotfiles"

# Alacritty
ln -sf "${DOTFILES}/alacritty/.alacritty.yml" "${HOME}/.alacritty.yml"

# Git
ln -sf "${DOTFILES}/git/.gitconfig" "${HOME}/.gitconfig"

# I3
mkdir -p "${HOME}/.config/i3" && \
    mkdir -p "${HOME}/.config/bumblebee-status/themes" && \
    mkdir -p "${HOME}/.config/bumblebee-status/themes/icons" && \
    ln -sf "${DOTFILES}/i3/config" "${HOME}/.config/i3/config" && \
    ln -sf "${DOTFILES}/i3/custom-theme.json" "${HOME}/.config/bumblebee-status/themes/custom-theme.json" && \
    ln -sf "${DOTFILES}/i3/custom-icons.json" "${HOME}/.config/bumblebee-status/themes/icons/custom-icons.json"

# Emacs
mkdir -p "${HOME}/.emacs.d" && ln -sf "${DOTFILES}/emacs/init.el" "${HOME}/.emacs.d/init.el"

# Neovim
mkdir -p "${HOME}/.config/nvim" && ln -sf "${DOTFILES}/nvim/init.lua" "${HOME}/.config/nvim/init.lua"

# Picom
mkdir -p "${HOME}/.config/picom" && ln -sf "${DOTFILES}/picom/picom.conf" "${HOME}/.config/picom/picom.conf"

# Qutebrowser
mkdir -p "${HOME}/.config/qutebrowser/bookmarks" && \
    ln -sf "${DOTFILES}/qutebrowser/config.py" "${HOME}/.config/qutebrowser/config.py" && \
    ln -sf "${DOTFILES}/qutebrowser/themes.py" "${HOME}/.config/qutebrowser/themes.py" && \
    ln -sf "${DOTFILES}/qutebrowser/quickmarks" "${HOME}/.config/qutebrowser/quickmarks" && \
    ln -sf "${DOTFILES}/qutebrowser/bookmarks/urls" "${HOME}/.config/qutebrowser/bookmarks/urls"

# Starship
ln -sf "${DOTFILES}/starship/starship.toml" "${HOME}/.config/starship.toml"

# Tmux
ln -sf "${DOTFILES}/tmux/.tmux.conf" "${HOME}/.tmux.conf"

# Xmobar
ln -sf "${DOTFILES}/xmobar/.xmobarrc" "${HOME}/.xmobarrc"

# Xmonad
mkdir -p "${HOME}/.xmonad" && ln -sf "${DOTFILES}/xmonad/xmonad.hs" "${HOME}/.xmonad/xmonad.hs"

# Xorg
ln -sf "${DOTFILES}/xorg/.xinitrc" "${HOME}/.xinitrc"

# Zsh
ln -sf "${DOTFILES}/zsh/.zshrc" "${HOME}/.zshrc"
