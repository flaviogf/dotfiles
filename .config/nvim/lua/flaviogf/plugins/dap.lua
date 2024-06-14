return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    local dap = require('dap')

    dap.adapters.ruby = function(callback, config)
      callback({
        type = 'server',
        host = '127.0.0.1',
        port = '${port}',
        executable = {
          command = 'bundle',
          args = {
            'exec', 'rdbg', '--open', '--port', '${port}', '-c', '--',
            'bundle', 'exec', config.command, config.script,
          },
        },
      })
    end

    dap.configurations.ruby = {
      {
        type = 'ruby',
        name = 'Debug',
        request = 'attach',
        localfs = true,
        command = 'ruby',
        script = '${file}',
      },
      {
        type = 'ruby',
        name = 'Debug test',
        request = 'attach',
        localfs = true,
        command = 'rspec',
        script = '${file}',
      },
    }

    require('dapui').setup()
  end,
}
