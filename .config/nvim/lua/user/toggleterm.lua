local ok, toggleterm = pcall(require, 'toggleterm')

if not ok then
  return
end

toggleterm.setup({
  open_mapping = [[<C-\>]],
  direction = 'vertical',
  size = 80,
})
