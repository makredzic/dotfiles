# Dotfiles
This repository holds all the .configfiles that are used by various software apps such as nvim, wezterm, etc.

## Structure
- Each directory holds one dotfile which should be symlinked to `~` with the same name.
- The `.config` file holds the directories and files that should be symlinked to `~/.config/` with the same directory structure (e.g. `dotfiles/.config/vim/init.vim` -> `~/.config/vim.init.vim`)

## Usage
- Running `./symlink.sh` will create symlinks for each config file to their expected locations (e.g. `.zshrc` to `~`, `vim.init` to `~/.config/vim/init.vim`, etc.).
- Currently, each `ln -s` call is hardcoded in the script and for each addition of a new config file, the script needs to be updated to add a new `ln -s` call.
- `NixOS` should use its `home-manager` to read the contents of each config file (the `symlink.sh` script should **NOT** be used).


