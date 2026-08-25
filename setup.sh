#!/bin/zsh

# Get path of the scipt DIR
src="${0:A:h}"

#
# Configure [Z]sh

# Link zshenv
ln -s "$src/zsh/dot-zshenv" "$HOME/.zshenv"

# Link zshrc
[ ! -d "$HOME/.config/zsh" ] && mkdir -p "$HOME/.config/zsh"
ln -s $src/zsh/dot-zshrc $HOME/.config/zsh/.zshrc

# Link starship
ln -s $src/zsh/starship.toml $HOME/.config/zsh/starship.toml

# Link aliases
ln -s $src/zsh/alias $HOME/.config/zsh/aliasrc

# Create required DIRs
[ ! -d "$HOME/.local/state/zsh" ] && mkdir -p "$HOME/.local/state/zsh"
[ ! -d "$HOME/.cache/zsh" ] && mkdir -p "$HOME/.cache/zsh"
