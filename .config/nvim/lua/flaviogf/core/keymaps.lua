local keymap = vim.keymap

vim.g.mapleader = ' '

local opts = { noremap = true, silent = true }

keymap.set('n', ' ', '<Nop>', opts)
keymap.set('v', 'p', '"_dP', opts)
keymap.set('n', '<leader>b', ':Telescope buffers<cr>', opts)
keymap.set('n', '<leader>f', ':Telescope find_files<cr>', opts)
keymap.set('n', '<leader>rg', ':Telescope live_grep<cr>', opts)
