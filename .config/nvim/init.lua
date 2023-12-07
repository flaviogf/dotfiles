local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'nvim-lua/plenary.nvim',
  'editorconfig/editorconfig-vim',
  'nvim-lualine/lualine.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-treesitter/nvim-treesitter',
  'shaunsingh/nord.nvim'
})

require('lualine').setup({})
require('nvim-tree').setup({})
require('telescope').setup({})
require('nvim-treesitter.configs').setup({})

local mapleader = ' '

local opts = { noremap = true, silent = true }

vim.keymap.set('n', mapleader, '<Nop>', opts)

vim.g.mapleader = mapleader

vim.keymap.set('v', 'p', '"_dP', opts)
vim.keymap.set('n', '<leader>1', ':NvimTreeToggle <cr>', opts)
vim.keymap.set('n', '<leader>f', ':Telescope find_files<cr>', opts)
vim.keymap.set('n', '<leader>rg', ':Telescope live_grep<cr>', opts)
vim.keymap.set('n', '<leader><C-l>.', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
vim.keymap.set('n', '<leader><C-l>d', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
vim.keymap.set('n', '<leader><C-l>f', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
vim.keymap.set('n', '<leader><C-l>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_backgrounds = true
vim.g.nord_cursorline_transparent = true
vim.g.nord_enable_sidebar_background = true
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true

vim.cmd("colorscheme nord")

vim.opt.clipboard = 'unnamedplus'
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
vim.opt.sidescrolloff = 8
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
