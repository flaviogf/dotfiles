return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup({
      auto_install = true,
      ensure_installed = 'all',
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
