local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- shared
  'nvim-lua/plenary.nvim',

  -- core
  'editorconfig/editorconfig-vim',
  'folke/tokyonight.nvim',
  'nvim-lualine/lualine.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-tree/nvim-web-devicons',
  'nvim-treesitter/nvim-treesitter',

  -- code completion
  'github/copilot.vim',
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
})

-- core
require('lualine').setup({})
require('telescope').setup({})
require('nvim-treesitter.configs').setup({ ensure_installed = 'all', auto_install = true, highlight = { enable = true } })

-- code completion
require('mason').setup({})
require('mason-lspconfig').setup({})

for _, name in ipairs({ 'gopls', 'lua_ls', 'solargraph' }) do
  require('lspconfig')[name].setup({})
end

-- customizations
vim.cmd('colorscheme tokyonight-night')

local mapleader = ' '
vim.g.mapleader = mapleader

local opts = { noremap = true, silent = true }
vim.keymap.set('n', mapleader, '<Nop>', opts)
vim.keymap.set('v', 'p', '"_dP', opts)
vim.keymap.set('n', '<leader>b', ':Telescope buffers<cr>', opts)
vim.keymap.set('n', '<leader>f', ':Telescope find_files<cr>', opts)
vim.keymap.set('n', '<leader>rg', ':Telescope live_grep<cr>', opts)

vim.opt.clipboard = 'unnamedplus'
vim.opt.colorcolumn = { 80, 120 }
vim.opt.cursorline = true
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.history = 200
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.wildmenu = true
vim.opt.wildmode = 'full'
vim.opt.wrap = false
