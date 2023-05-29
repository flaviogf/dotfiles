local ok, toggleterm = pcall(require, 'toggleterm')

if not ok then
  return
end

toggleterm.setup({
  direction = 'vertical',
  open_mapping = '<leader>2',
  insert_mappings = false,
  terminal_mappings = false,
  size = vim.o.columns * 0.4,
})
