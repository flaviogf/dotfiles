local g = vim.g
local keymap = vim.keymap.set

local mapleader = ' '

local opts = { noremap = true, silent = true }

keymap('n', mapleader, '<Nop>', opts)

g.mapleader = mapleader

keymap('v', 'p', '"_dP', opts)

keymap('n', '<leader>1', ':NvimTreeToggle <cr>', opts)
keymap('n', '<leader>f', ':Telescope find_files<cr>', opts)
keymap('n', '<leader>g', '<cmd>lua require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", direction = "float", hidden = true }):toggle()<cr>', opts)
keymap('n', '<leader>rg', ':Telescope live_grep<cr>', opts)
keymap('n', '<leader><C-l>.', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
keymap('n', '<leader><C-l>d', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
keymap('n', '<leader><C-l>ev', '<cmd>lua require("jdtls").extract_variable()<cr>', opts)
keymap('n', '<leader><C-l>f', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
keymap('n', '<leader><C-l>oi', '<cmd>lua require("jdtls").organize_imports()<cr>', opts)
keymap('n', '<leader><C-l>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)

keymap('v', '<leader><C-l>em', '<cmd>lua require("jdtls").extract_method(true)<cr>', opts)
keymap('v', '<leader><C-l>ev', '<cmd>lua require("jdtls").extract_variable(true)<cr>', opts)
