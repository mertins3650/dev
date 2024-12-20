#!/usr/bin/env bash
sudo apt -y install tmux

mkdir -p "$HOME/.local/bin/"
ln -s "$HOME/dotfiles/scripts/tmux-sessionizer" "$HOME/.local/bin/tmux-sessionizer"
ln -s "$HOME/dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"

