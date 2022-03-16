#!/bin/sh

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"
brew update

# zsh
sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)

# zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# starship
brew install starship

# rustup
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

#exa
cargo install exa

# neovim
brew install neovim

# dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm installer.sh

# nodenv
brew install nodenv
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash

# direnv
brew install direnv

ln -sf ~/dotfiles/mac/.zshrc ~/.zshrc
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/mac/.hyper.js ~/.hyper.js

mkdir ~/.config
ln -sf ~/dotfiles/nvim/ ~/.config/nvim

source ~/.zshrc
