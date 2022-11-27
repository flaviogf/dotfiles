#!/usr/bin/env bash

DOTFILES="${HOME}/dev/dotfiles"

# Starship
ln -sf "${DOTFILES}/starship/starship.toml" "${HOME}/.config/starship.toml"

# Xorg
ln -sf "${DOTFILES}/xorg/.xinitrc" "${HOME}/.xinitrc"
