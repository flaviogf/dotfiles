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
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-treesitter/nvim-treesitter',

  -- lsp
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/nvim-cmp',
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  --copilot
  'github/copilot.vim',
})

-- core
require('lualine').setup({})
require('nvim-tree').setup({})
require('nvim-treesitter.configs').setup({})
require('telescope').setup({})

-- lsp
require('mason').setup({})
require('mason-lspconfig').setup({})

local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end),
    ['<C-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }),
})

for _, name in ipairs({ 'gopls', 'jdtls', 'lua_ls', 'pylsp', 'solargraph' }) do
  require('lspconfig')[name].setup({ capabilities = require('cmp_nvim_lsp').default_capabilities() })
end

vim.cmd('colorscheme tokyonight-night')

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
