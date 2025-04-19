#!/bin/bash
sudo apt-get update
sudo apt-get install -y zsh

echo "до mkdir"

# Папка для плагинов zsh:
mkdir -p -v $HOME/.zsh

echo "после mkdir"

# Путь к папке со скриптом:
SCRIPT_DIR=$(dirname $0)

echo "SCRIPT_DIR = $SCRIPT_DIR"

cp -v $SCRIPT_DIR/.zshrc $HOME/

echo "после cp"

git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting
git clone https://github.com/olets/zsh-abbr --recurse-submodules --single-branch --branch main --depth 1 \
          $HOME/.zsh/zsh-abbr

echo "после git"

chsh -s $(which zsh)
zsh
source $HOME/.zshrc