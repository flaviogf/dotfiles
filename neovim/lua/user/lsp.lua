local keymap = vim.keymap.set

local ok, lspconfig = pcall(require, 'lspconfig')

if not ok then
  return
end

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if not ok then
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  keymap('n', '==', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

lspconfig['jdtls'].setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require('jdtls').start_or_attach({
      cmd = { 'jdtls' },
    })

    local opts = { noremap = true, silent = true, buffer = bufnr }
    keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', '==', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end,
})

lspconfig['solargraph'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})


lspconfig['lua_ls'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

