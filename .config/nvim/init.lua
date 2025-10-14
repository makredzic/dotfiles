local vim = vim

-- Disabling netrw because of nvim-tree plugin
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


local Plug = vim.fn['plug#']

-- General settings
vim.opt.termguicolors = true
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
Plug('nvim-tree/nvim-tree.lua')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })

Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')

vim.call('plug#end')

-- Setup certain plugins
require('lualine').setup()
require('catppuccin').setup({
    integrations = {
        treesitter = true,
        nvimtree = true
    }
})

require('nvim-tree').setup()
require('nvim-treesitter.configs').setup {
    ensure_installed = { "javascript", "lua", "vim", "c", "markdown", "markdown_inline"},
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }
}

require("mason").setup()
-- 2) Optional: tweak specific servers BEFORE enabling
--    (Example for Lua: recognize the global 'vim')
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
    },
  },
})

-- 3) Mason-lspconfig (installer + auto-enable)
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    -- Replace these with the exact server names you use and that exist in nvim-lspconfig:
    -- "pyright" or "pyrefly" (Python), "marksman" (Markdown), etc.
    -- "quick_lint_js" is a linter that *can* speak LSP, but double-check how you want to run it.
  },
  automatic_enable = true,  -- v2 style; replaces old handlers boilerplate
})

-- 
-- BINDINGS
-- 
vim.g.mapleader = ' '

--nvim-tree
vim.keymap.set('n', '<leader>b', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>n', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>.', vim.lsp.buf.hover, { desc = 'Shows error' })

-- Color theme setup
vim.cmd.colorscheme("catppuccin-mocha")
