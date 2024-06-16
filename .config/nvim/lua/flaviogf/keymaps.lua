local keymap = vim.keymap

vim.g.mapleader = ' '

local opts = { noremap = true, silent = true }

keymap.set('v', 'p', '"_dP', opts)

keymap.set('n', ' ', '<Nop>', opts)

keymap.set('n', '<leader>tb', ':Telescope buffers<cr>', opts)
keymap.set('n', '<leader>tf', ':Telescope find_files<cr>', opts)
keymap.set('n', '<leader>tg', ':Telescope live_grep<cr>', opts)

keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<cr>', opts)

keymap.set('n', '<leader>db', ':DapToggleBreakpoint<cr>', opts)
keymap.set('n', '<leader>dc', ':DapContinue<cr>', opts)
keymap.set('n', '<leader>dso', ':DapStepOver<cr>', opts)
keymap.set('n', '<leader>dsi', ':DapStepInto<cr>', opts)
keymap.set('n', '<leader>dui', '<cmd>lua require("dapui").toggle()<cr>', opts)

keymap.set('n', '<leader>jtc', '<cmd>lua require("jdtls").test_class()<cr>', opts)
keymap.set('n', '<leader>jtm', '<cmd>lua require("jdtls").test_nearest_method()<cr>', opts)
