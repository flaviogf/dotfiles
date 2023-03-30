local ok, dap = pcall(require, 'dap')

if not ok then
  return
end

dap.adapters.ruby = function(callback, config)
  callback({
    type = 'server',
    host = config.server,
    port = config.port,
    executable = {
      command = 'bundle',
      args = { 'exec', 'rdbg', '-n', '--open', '--port', '38698', '-c', '--', 'bundle', 'exec', config.command, config.script },
    },
  })
end

dap.configurations.ruby = {
  {
    type = 'ruby',
    name = 'run rspec current_file',
    bundle = 'bundle',
    request = 'attach',
    command = "rspec",
    script = "${file}",
    port = 38698,
    server = '127.0.0.1',
    options = {
      source_filetype = 'ruby',
    },
    localfs = true,
    waiting = 1000,
  },
}
