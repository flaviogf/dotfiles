require 'user.cmp'
require 'user.colorizer'
require 'user.gitsigns'
require 'user.keymaps'
require 'user.lsp'
require 'user.lualine'
require 'user.options'
require 'user.telescope'
require 'user.toggleterm'
require 'user.tree'
require 'user.treesitter'
require 'user.which_key'

local path = '/home/flaviogf/.local/share/nvim/site/pack/packer/start/packer.nvim'

local cmd = vim.cmd

local fn = vim.fn

local setup = function()
  if fn.empty(fn.glob(path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', path })
    cmd('packadd packer.nvim')
    return true
  end

  return false
end

local started = setup()

local ok, packer = pcall(require, 'packer')

if not ok then
  return
end

packer.startup(function(use)
  use { 'akinsho/toggleterm.nvim' }
  use { 'editorconfig/editorconfig-vim' }
  use { 'folke/which-key.nvim' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'mfussenegger/nvim-dap' }
  use { 'mfussenegger/nvim-jdtls' }
  use { 'neovim/nvim-lspconfig' }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-tree/nvim-tree.lua' }
  use { 'nvim-tree/nvim-web-devicons' }
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'shaunsingh/nord.nvim' }
  use { 'wbthomason/packer.nvim' }

  if started then
    packer.sync()
  end
end)