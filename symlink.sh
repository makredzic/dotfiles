#!/bin/bash

DOT_DIR=~/dotfiles
LN_FLAGS="-s"

# Append additional flags to ln
while (( $# )); do
  case "$1" in
    -*)
      LN_FLAGS="$LN_FLAGS $1"  # Append flags
      shift
      ;;
    *)
      break
      ;;
  esac
done

CMD="ln $LN_FLAGS"

$CMD "$DOT_DIR/wezterm/.wezterm.lua" ~/.wezterm.lua
$CMD "$DOT_DIR/zsh/.zshrc" ~/.zshrc

if [ -d "~/.config/nvim" ]; then
    echo "~/.config/nvim doesn't exist. Creating it."
    mkdir -p ~/.config/nvim
fi

$CMD "$DOT_DIR/.config/nvim/init.vim" ~/.config/nvim/init.vim


