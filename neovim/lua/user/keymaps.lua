local g = vim.g
local keymap = vim.keymap.set

local mapleader = ' '

local opts = { noremap = true, silent = true }

keymap('n', mapleader, '<Nop>', opts)

g.mapleader = mapleader

keymap('v', 'p', '"_dP', opts)

keymap('n', '<leader>1', ':NvimTreeToggle <cr>', opts)
keymap('n', '<leader>f', ':Telescope find_files<cr>', opts)
keymap('n', '<leader><C-r>v', '<cmd>lua require("jdtls").extract_variable()<cr>', opts)
keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
