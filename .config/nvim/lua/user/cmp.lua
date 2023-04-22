local ok, cmp = pcall(require, 'cmp')

if not ok then
  return
end

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item() else fallback() end
    end),
    ['<C-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_prev_item() else fallback() end
    end),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }),
})
