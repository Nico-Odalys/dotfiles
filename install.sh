#!/bin/bash
set -e

echo "==> Installation de zsh..."
sudo apt-get update -q && sudo apt-get install -y zsh

echo "==> Installation de Oh My Zsh..."
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "==> Installation de Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

echo "==> Installation de zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

echo "==> Installation de zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

echo "==> Copie des dotfiles..."
# Le repo est cloné dans ~/dotfiles par VS Code
cp ~/dotfiles/.zshrc ~/.zshrc
cp ~/dotfiles/.p10k.zsh ~/.p10k.zsh

echo "==> Changement du shell par défaut en zsh..."
sudo chsh -s "$(which zsh)" "$(whoami)"

echo "==> Dotfiles installés !"