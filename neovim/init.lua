require 'user.gitsigns'
require 'user.lualine'
require 'user.options'

local cmd = vim.cmd
local keymap = vim.keymap.set

cmd('packadd packer.nvim')

require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }

  use { 'nvim-lua/plenary.nvim' }

  use { 'arcticicestudio/nord-vim' }
  use { 'editorconfig/editorconfig-vim' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'nvim-tree/nvim-tree.lua' }
  use { 'nvim-treesitter/nvim-treesitter' }

  use { 'nvim-telescope/telescope.nvim' }

  use { 'neovim/nvim-lspconfig' }
  use { 'mfussenegger/nvim-jdtls' }

  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
end)

require('telescope').setup({})

require('nvim-tree').setup({})

require('nvim-treesitter.configs').setup({
  ensure_installed = { 'go', 'java', 'ruby' },
  highlight = {
    enable = true,
  },
})

require('lspconfig')['solargraph'].setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', '==', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end,
})

require('lspconfig')['jdtls'].setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client, bufnr)
    require('jdtls').start_or_attach({
      cmd = { 'jdtls' },
    })

    local opts = { noremap = true, silent = true, buffer = bufnr }
    keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', '==', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end,
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

cmd("colorscheme nord")
