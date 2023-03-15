require 'user.cmp'
require 'user.gitsigns'
require 'user.keymaps'
require 'user.lsp'
require 'user.lualine'
require 'user.options'
require 'user.telescope'
require 'user.tree'
require 'user.treesitter'
require 'user.which_key'

local cmd = vim.cmd

cmd('packadd packer.nvim')

local ok, packer = pcall(require, 'packer')

if not ok then
  return
end

packer.startup(function(use)
  use { 'editorconfig/editorconfig-vim' }
  use { 'folke/which-key.nvim' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'mfussenegger/nvim-jdtls' }
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-tree/nvim-tree.lua' }
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'shaunsingh/nord.nvim' }
  use { 'wbthomason/packer.nvim' }
end)
