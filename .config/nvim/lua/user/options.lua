local cmd = vim.cmd
local g = vim.g
local set = vim.opt

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

g.nord_contrast = true
g.nord_borders = true
g.nord_disable_backgrounds = true
g.nord_cursorline_transparent = true
g.nord_enable_sidebar_background = true
g.nord_italic = true
g.nord_uniform_diff_background = true
g.nord_bold = true

cmd("colorscheme nord")

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
