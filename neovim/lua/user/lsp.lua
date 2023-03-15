local ok, lspconfig = pcall(require, 'lspconfig')

if not ok then
  return
end

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if not ok then
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function() require('jdtls').start_or_attach({ cmd = { 'jdtls' }, }) end

lspconfig['jdtls'].setup({ capabilities = capabilities, on_attach = on_attach })

lspconfig['lua_ls'].setup({ capabilities = capabilities })

lspconfig['solargraph'].setup({ capabilities = capabilities })
