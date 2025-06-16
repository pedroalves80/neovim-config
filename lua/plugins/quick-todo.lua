return {
  'SyedAsimShah1/quick-todo.nvim',
  config = function()
    require('quick-todo').setup {
      keys = {
        open = '<leader>td',
      },
      window = {
        height = 0.5,
        width = 0.5,
        winblend = 0,
        border = 'rounded',
      },
    }
  end,
}
