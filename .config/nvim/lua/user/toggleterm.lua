local ok, toggleterm = pcall(require, 'toggleterm')

if not ok then
  return
end

toggleterm.setup({
  direction = 'vertical',
  open_mapping = '<leader>2',
  terminal_mappings = false,
  size = vim.o.columns * 0.5,
})
