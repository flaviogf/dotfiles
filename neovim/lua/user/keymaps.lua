local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }
keymap('v', 'p', '"_dP', opts)
