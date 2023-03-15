local ok, treesitter = pcall(require, 'nvim-treesitter.configs')

if not ok then
  return
end

treesitter.setup({
  ensure_installed = { 'go', 'java', 'ruby' },
  highlight = {
    enable = true,
  },
})
