require 'user.gitsigns'
require 'user.keymaps'
require 'user.lsp'
require 'user.lualine'
require 'user.options'
require 'user.telescope'

local cmd = vim.cmd
local keymap = vim.keymap.set

cmd('packadd packer.nvim')

require('packer').startup(function(use)
  use { 'arcticicestudio/nord-vim' }
  use { 'editorconfig/editorconfig-vim' }
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
  use { 'wbthomason/packer.nvim' }
end)

require('nvim-tree').setup({})

require('nvim-treesitter.configs').setup({
  ensure_installed = { 'go', 'java', 'ruby' },
  highlight = {
    enable = true,
  },
})

local cmp = require('cmp')

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
