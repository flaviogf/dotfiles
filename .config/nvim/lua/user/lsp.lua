local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if not ok then
  return
end

local ok, lspconfig = pcall(require, 'lspconfig')

if not ok then
  return
end

lspconfig.gopls.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

lspconfig.lua_ls.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

lspconfig.solargraph.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
})
