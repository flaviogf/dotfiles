local cmd = vim.cmd
local g = vim.g
local keymap = vim.keymap.set
local set = vim.opt

cmd("colorscheme nord")

g.mapleader = ','

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

local opts = { noremap = true, silent = true }
keymap('v', 'p', '"_dP', opts)
