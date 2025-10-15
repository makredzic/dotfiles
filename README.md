# Dotfiles
This repository holds all the .configfiles that make your terminal shell nicer to look at at :) (and more useful!).

## Structure
- Each directory holds one dotfile which should be symlinked to `~` with the same name.
- The `.config` file holds the directories and files that should be symlinked to `~/.config/` with the same directory structure (e.g. `dotfiles/.config/vim/init.vim` -> `~/.config/vim/init.vim`)

# Setup
1. Download and install all the dependencies below. Install them however you wish on your system, they just need to be there.
2. **Double check `zsh/.zshrc` and delete anything/everything you might not need under the REMOVE THESE section.**
3. Run `symlink.sh` **in this project's root folder**. *(pass -f optionally to override existing symlinks)*
4. Run `:PlugInstall` inside of `nvim` to install all the plugins listed in `./config/nvim/init.lua`

## Dependencies
This is the list of additional dependencies that had to be installed on the system for the entire configuration to work.

### Shell
- [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#install-and-set-up-zsh-as-default)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh?tab=readme-ov-file#basic-installation)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
- [Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)
- [bat](https://github.com/sharkdp/bat) *(Needed to set alias cat='bat')*

### Neovim
- [neovim v0.11+](https://github.com/neovim/neovim/releases/tag/nightly)
- [vim-plug](https://junegunn.github.io/vim-plug/installation/) *(To load nvim plugins in init.vim)*
- [fd](https://github.com/sharkdp/fd) *(For the plugin nvim-telescope)*
- [ripgrep](https://github.com/BurntSushi/ripgrep) *(For the plugin nvim-telescope)*

### Closing notes
- Running `./symlink.sh` will create symlinks for each config file to their expected locations (e.g. `.zshrc` to `~`, `vim.init` to `~/.config/vim/init.vim`, etc.). An additional `-f` flag (or any other) can be passed to the script to replace existing config files with the new symlinks (otherwise, each existing file will cause an error on symlink creation).
- Currently, each `ln -s` call is hardcoded in the script and for each addition of a new config file, the script needs to be updated to add a new `ln -s` call.
- `NixOS` should use its `home-manager` to read the contents of each config file (the `symlink.sh` script should **NOT** be used).
