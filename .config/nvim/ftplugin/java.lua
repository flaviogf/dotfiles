local bundles = { vim.fn.glob('~/.vscode/extensions/vscjava.vscode-java-debug-*/server/com.microsoft.java.debug.plugin-*.jar', 1) }

vim.list_extend(bundles, vim.split(vim.fn.glob('~/.vscode/extensions/vscjava.vscode-java-test-*/server/*.jar', 1), '\n'))

require('jdtls').start_or_attach({
  on_attach = function(_, _) require('jdtls').setup_dap({ hotcodereplace = 'auto' }) end,
  root_dir = require('jdtls.setup').find_root({ 'mvnw' }),
  init_options = { bundles = bundles },
  cmd = { 'jdtls' },
})
