local g = vim.g
local keymap = vim.keymap.set

local mapleader = ' '

local opts = { noremap = true, silent = true }

keymap('n', mapleader, '<Nop>', opts)

g.mapleader = mapleader

keymap('n', '<leader>1', ':NvimTreeToggle <CR>', opts)
keymap('n', '<leader>f', ':Telescope find_files<CR>', opts)

keymap('v', 'p', '"_dP', opts)
