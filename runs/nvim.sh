sudo pacman -Syu --noconfirm neovim 

rm -rf ~/.config/nvim

ln -s $HOME/dotfiles/nvim/ $HOME/.config/nvim
