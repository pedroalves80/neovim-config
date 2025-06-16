return {
  'sindrets/diffview.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('diffview').setup {
      enhanced_diff_hl = true,
      use_icons = true,
      icons = {
        folder_closed = '',
        folder_open = '',
      },
    }

    vim.keymap.set('n', '<leader>gs', '<cmd>DiffviewOpen<cr>', { desc = '[G]it [S]tatus' })
    vim.keymap.set('n', '<leader>gq', '<cmd>DiffviewClose<cr>', { desc = '[G]it [Q]uit Diffview' })
  end,
}
