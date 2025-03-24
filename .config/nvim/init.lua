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
require("mason-lspconfig").setup {
  -- automatically install language servers setup below for lspconfig
  automatic_installation = true,
  ensure_installed = { "lua_ls", "quick_lint_js", "pyre", "markdown_oxide"}
}

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    --["rust_analyzer"] = function ()
        --require("rust-tools").setup {}
    --end
}

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
