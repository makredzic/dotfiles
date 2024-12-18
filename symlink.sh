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


#
# home dir linked files
#

$CMD "$DOT_DIR/wezterm/.wezterm.lua" ~/.wezterm.lua
$CMD "$DOT_DIR/zsh/.zshrc" ~/.zshrc
$CMD "$DOT_DIR/.themes" ~/
$CMD "$DOT_DIR/.icons" ~/




#
# .config files
#
#
$CMD "$DOT_DIR/.config/bat" ~/.config/bat
$CMD "$DOT_DIR/.config/nvim" ~/.config/nvim
$CMD "$DOT_DIR/.config/starship.toml" ~/.config/starship.toml


