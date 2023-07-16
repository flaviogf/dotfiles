local ok, telescope = pcall(require, 'telescope')

if not ok then
  return
end

telescope.setup({
  pickers = {
    find_files = {
      hidden = true,
    },
  },
})