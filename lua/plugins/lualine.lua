return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  opts = {
    options = {
      theme = 'onedark',
    },
  },
  config = function()
    local lualine = require 'lualine'

    lualine.setup {
      sections = {
        lualine_x = {
          function()
            return require('copilot_status').status_string()
          end,
          function()
            return require('copilot_status').enabled()
          end,
          'filetype',
          'fileformat',
        },
      },
    }
  end,
}
