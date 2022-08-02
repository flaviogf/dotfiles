require('packer').startup(function(use)
  use { 'dracula/vim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'tpope/vim-dispatch' }
end)

require('lualine').setup({
  options = {
    component_separators = '',
    section_separators = '',
    theme = 'dracula',
  },
})

vim.g.mapleader = ','

vim.opt.clipboard = 'unnamedplus'
vim.opt.colorcolumn = '80,120'
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
vim.opt.wildmenu = true
vim.opt.wildmode = full
vim.opt.wrap = false

vim.cmd "colorscheme dracula"
