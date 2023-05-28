local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if not ok then
  return
end

local ok, lspconfig = pcall(require, 'lspconfig')

if not ok then
  return
end

local ok, jdtls = pcall(require, 'jdtls')

if not ok then
  return
end

local ok, setup = pcall(require, 'jdtls.setup')

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

jdtls.start_or_attach({
  root_dir = setup.find_root({'mvnw'}),
  cmd = {'jdtls'},
})
