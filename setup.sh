#!/usr/bin/env bash
set -euo pipefail

# Wallpapers
mkdir -p ~/Images/wallpapers
cp -rf ~/.dotfiles/wallpapers ~/Images/wallpapers

# Util scripts
cp -rf ~/.dotfiles/.utils ~/.utils

# Root dotfiles
cp ~/.dotfiles/.Xresources ~/.Xresources
cp ~/.dotfiles/.bashrc ~/.bashrc
cp ~/.dotfiles/.gitconfig ~/.gitconfig

# Emacs
cp -rf ~/.dotfiles/.doom.d ~/.doom.d

# XMonad
cp -rf ~/.dotfiles/.xmonad ~/.xmonad
cp -rf ~/.dotfiles/xmobar ~/.config/xmobar
xmonad --recompile
xmonad --restart
