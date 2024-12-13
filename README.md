# Dotfiles
This repository holds all the .configfiles that are used by various software apps such as nvim, wezterm, etc.

## Structure
- Each directory holds one dotfile which should be symlinked to `~` with the same name.
- The `.config` file holds the directories and files that should be symlinked to `~/.config/` with the same directory structure (e.g. `dotfiles/.config/vim/init.vim` -> `~/.config/vim/init.vim`)

## Usage
- Running `./symlink.sh` will create symlinks for each config file to their expected locations (e.g. `.zshrc` to `~`, `vim.init` to `~/.config/vim/init.vim`, etc.). An additional `-f` flag (or any other) can be passed to the script to replace existing config files with the new symlinks (otherwise, each existing file will cause an error on symlink creation).
- Currently, each `ln -s` call is hardcoded in the script and for each addition of a new config file, the script needs to be updated to add a new `ln -s` call.
- `NixOS` should use its `home-manager` to read the contents of each config file (the `symlink.sh` script should **NOT** be used).

## Setup
1. Download and install all the dependencies below,
2. Run `symlink.sh`,
3. Run `:PlugInstall` inside of `nvim` to install all plugins listed in `./config/nvim/init.lua`

## Dependencies
This is the list of additional dependencies that had to be installed on the system for the entire configuration to work.

### Oh My Zsh
- [Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
- [bat](https://github.com/sharkdp/bat) *(Needed to set alias cat='bat')*

### Neovim
- [vim-plug](https://junegunn.github.io/vim-plug/installation/) *(To load nvim plugins in init.vim)*

