return {
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('onedark').setup {
      transparent = true,
      style = 'warm',

      lualine = {
        transparent = true, -- lualine center bar transparency
      },
    }
    vim.cmd [[colorscheme onedark]]
  end,
}
