#!/usr/bin/env bash
set -euo pipefail

# Wallpapers
mkdir -p ~/Images/wallpapers
cp -rf ~/.dotfiles/wallpapers ~/Images

# Util scripts
cp -rf ~/.dotfiles/.utils ~

# Root dotfiles
cp ~/.dotfiles/.Xresources ~
xrdb ~/.Xresources
cp ~/.dotfiles/.bashrc ~
cp ~/.dotfiles/.gitconfig ~

# Emacs
cp -rf ~/.dotfiles/.doom.d ~
~/.emacs.d/bin/doom sync

# XMonad
cp -rf ~/.dotfiles/.xmonad ~
cp -rf ~/.dotfiles/xmobar ~/.config
if pgrep xmobar >/dev/null
then
    killall xmobar
fi
xmonad --recompile
xmonad --restart
