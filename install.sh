#!/bin/bash
sudo apt-get update
sudo apt-get install -y zsh

# Папка для плагинов zsh:
mkdir -p -v $HOME/.zsh

# Путь к папке со скриптом:
SCRIPT_DIR=$(dirname $0)

cp -v $SCRIPT_DIR/.zshrc $HOME/

git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting
git clone https://github.com/olets/zsh-abbr --recurse-submodules --single-branch --branch main --depth 1 \
          $HOME/.zsh/zsh-abbr

chsh -s $(which zsh)
zsh
source $HOME/.zshrc