#!/bin/sh

sudo apt update
sudo apt upgrade
sudo apt install build-essential

# zsh
sudo apt install zsh
sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)

# zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# rustup
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

#exa
cargo install exa

# neovim
sudo apt-get install neovim

# dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm installer.sh

# nodenv
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
cd ~/.nodenv && src/configure && make -C src

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

mkdir ~/.config
ln -sf ~/dotfiles/nvim/ ~/.config/nvim

source ~/.zshrc
