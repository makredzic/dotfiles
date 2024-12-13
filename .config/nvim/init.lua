local vim = vim
local Plug = vim.fn['plug#']

-- General settings
vim.o.compatible = false
vim.o.showmatch = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.number = true
vim.o.wildmode = "longest,list"
vim.o.clipboard = "unnamedplus"
vim.o.ttyfast = true
vim.o.swapfile = false

-- Filetype and syntax settings
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- Load vim-plug
vim.call('plug#begin')
Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
vim.call('plug#end')

-- Set colorscheme
vim.cmd("colorscheme catppuccin-mocha")

require('lualine').setup()
