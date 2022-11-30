local cmd = vim.cmd
local g = vim.g
local keymap = vim.keymap.set
local set = vim.opt

cmd('packadd packer.nvim')

require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }

  use { 'arcticicestudio/nord-vim' }
  use { 'editorconfig/editorconfig-vim' }
  use { 'glepnir/dashboard-nvim' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-project.nvim' }
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'phaazon/hop.nvim' }
  use { 'tpope/vim-dispatch' }
end)

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

require('hop').setup()

require('lspconfig')['solargraph'].setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', '==', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end,
})

require('lualine').setup({
  options = {
    component_separators = '',
    section_separators = '',
    theme = 'nord',
  },
})

require('telescope').setup({
  extensions = {
    project = {
      base_dirs = {
        '~/dev',
      },
    },
  },
})

require('telescope').load_extension('project')

cmd("colorscheme nord")

g.mapleader = ','

local opts = { noremap = true, silent = true }
keymap('n', '<leader>at', '<cmd>HopPattern <CR>', opts)
keymap('n', '<leader>f', '<cmd>Telescope fd <CR>', opts)
keymap('v', 'p', '"_dP', opts)
keymap('n', '<leader>p', ":lua require('telescope').extensions.project.project({ display_type = 'full' })<CR>", opts)

set.clipboard = 'unnamedplus'
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
set.wildmode = 'full'
set.wrap = false
