vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim.api.nvim_add_user_command("CopyRelPath", "call setreg('+', expand('%'))", {})
vim.api.nvim_create_user_command('CopyRelPath', function()
  vim.fn.setreg('+', vim.fn.expand '%:p')
end, {
  desc = 'Copy the relative path of the current file to the clipboard',
})
