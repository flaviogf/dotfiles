local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if not ok then
  return
end

local ok, lspconfig = pcall(require, 'lspconfig')

if not ok then
  return
end

lspconfig.lua_ls.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

lspconfig.jdtls.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

lspconfig.solargraph.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
})
