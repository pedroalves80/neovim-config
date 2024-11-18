return {
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('onedark').setup {
      transparent = true,
      style = 'warm',
    }
    vim.cmd [[colorscheme onedark]]
  end,
}
