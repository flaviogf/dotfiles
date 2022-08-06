require('packer').startup(function(use)
  use { 'dracula/vim' }
  use { 'editorconfig/editorconfig-vim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'tpope/vim-dispatch' }
end)

require('lualine').setup({
  options = {
    component_separators = '',
    section_separators = '',
    theme = 'dracula',
  },
})

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

require('lspconfig')['solargraph'].setup({
  on_attach = on_attach,
})

local cmd = vim.cmd
local g = vim.g
local keymap = vim.api.nvim_set_keymap
local set = vim.opt

cmd("colorscheme dracula")

g.mapleader = ','

keymap('v', 'p', '"_dP', { noremap = true, silent = true })

set.clipboard = 'unnamedplus'
set.colorcolumn = '80,120'
set.cursorline = true
set.encoding = 'utf-8'
set.expandtab = true
set.hidden = true
set.history = 200
set.ignorecase = true
set.incsearch = true
set.mouse = 'a'
set.number = true
set.relativenumber = true
set.scrolloff = 8
set.shiftwidth = 2
set.sidescrolloff = 8
set.smartcase = true
set.smartindent = true
set.softtabstop = 2
set.splitbelow = true
set.splitright = true
set.tabstop = 2
set.termguicolors = true
set.wildmenu = true
set.wildmode = "full"
set.wrap = false
