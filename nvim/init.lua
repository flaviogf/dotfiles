local cmp = require 'cmp'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'
local lspconfig = require 'lspconfig'
local packer = require 'packer'
local lualine = require 'lualine'

local cmd = vim.cmd
local g = vim.g
local keymap = vim.keymap.set
local set = vim.opt

packer.startup(function(use)
  use { 'dracula/vim' }
  use { 'editorconfig/editorconfig-vim' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'tpope/vim-dispatch' }
end)

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item() else fallback() end
    end),
    ['<C-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_prev_item() else fallback() end
    end),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }),
})

lspconfig['solargraph'].setup({
  capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  end,
})

lualine.setup({
  options = {
    component_separators = '',
    section_separators = '',
    theme = 'dracula',
  },
})

cmd("colorscheme dracula")

g.mapleader = ','

local opts = { noremap = true, silent = true }
keymap('n', '<leader>f', '<cmd>Telescope fd <CR>', opts)
keymap('v', 'p', '"_dP', opts)

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
