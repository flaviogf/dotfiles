local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local configuration = '/home/flaviogf/dev/' .. project_name .. '/config-linux'

local data = '/home/flaviogf/dev/' .. project_name

require('jdtls').start_or_attach({
  root_dir = require('jdtls.setup').find_root({ 'mvnw' }),
  cmd = { 'jdt-language-server', '-configuration', configuration, '-data', data },
})
