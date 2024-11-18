return {
  'f-person/git-blame.nvim',
  event = 'BufRead',
  config = function()
    vim.cmd [[
        nnoremap <leader>gb <cmd>GitBlameToggle<cr>
      ]]
  end,
}
