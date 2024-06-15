local home = os.getenv('HOME')

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    local dap = require('dap')

    dap.adapters.kotlin = {
      type = 'executable',
      command = home .. '/.local/share/nvim/mason/packages/kotlin-debug-adapter/adapter/bin/kotlin-debug-adapter',
      options = { auto_continue_if_many_stopped = false },
    }

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

    dap.configurations.kotlin = {
      {
        type = 'kotlin',
        name = 'Debug',
        request = 'attach',
        port = 5005,
        args = {},
        projectRoot = vim.fn.getcwd,
        hostName = 'localhost',
        timeout = 2000,
      },
    }

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
