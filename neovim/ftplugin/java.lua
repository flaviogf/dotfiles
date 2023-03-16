local cmp_nvim_lsp = require 'cmp_nvim_lsp'
local jdtls = require 'jdtls'

jdtls.start_or_attach({
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  cmd = { 'jdtls' },
})
