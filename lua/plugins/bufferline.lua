return {
  'akinsho/bufferline.nvim',
  event = { 'BufReadPre', 'BufAdd', 'BufNew', 'BufReadPost' },
  config = function()
    require('bufferline').setup {
      options = {
        tab_size = 0,
        diagnostics = 'nvim_lsp',
        offsets = {
          {
            filetype = 'NvimTree',
            text = '',
            text_align = 'center',
          },
        },
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    }
  end,
}
