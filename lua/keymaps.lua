--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Clear search highlight on escape
vim.keymap.set('n', '<Esc>', ':nohls<CR>', { silent = true })

-- Delete character with x without yanking
vim.keymap.set('n', 'x', '"_x')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Ctrl-Backspace tp delete word backwards
vim.keymap.set('i', '<C-h>', '<C-w>')
vim.keymap.set('c', '<C-h>', '<C-w>')

-- Close buffer
vim.keymap.set('n', '<C-w>', '<Cmd>bd<CR>')

-- New buffer
vim.keymap.set('n', '<leader>b', ':enew<CR>')

-- Copy Whole file
vim.keymap.set('n', '<C-c>', ':%y+<CR>')

-- Open terminal
vim.keymap.set('n', '<leader>tt', ':terminal<CR>', { desc = 'Open terminal' })

-- Split window
vim.keymap.set('n', '<leader>zh', ':vsplit<Return>', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>zv', ':split<Return>', { desc = 'Split window vertically' })

-- Don't yank on pasting
vim.keymap.set('v', 'p', 'P')

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Bufferline
vim.keymap.set('n', '<C-l>', '<Cmd>BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<C-h>', '<Cmd>BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', '<S-l>', '<Cmd>BufferLineMoveNext<CR>', { silent = true })
vim.keymap.set('n', '<S-h>', '<Cmd>BufferLineMovePrev<CR>', { silent = true })

-- Bufferline
vim.keymap.set('n', '<tab>', function()
  require('bufferline').cycle(1)
end, { desc = 'Goto next buffer' })

vim.keymap.set('n', '<S-tab>', function()
  require('bufferline').cycle(-1)
end, { desc = 'Goto prev buffer' })

vim.keymap.set('n', '<leader>x', function()
  vim.cmd 'bwipeout!'
end, { desc = 'Close Buffer' })

vim.keymap.set('n', '<leader>xx', function()
  vim.cmd 'bufdo bd'
end, { desc = 'Close all buffers' })

-- NvimTree
vim.keymap.set('n', '<Leader>e', '<Cmd>NvimTreeToggle<CR>', { silent = true })
vim.keymap.set('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', { silent = true })

-- Open terminal
vim.keymap.set('n', '<leader>tt', ':terminal<CR>')

-- Window Navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

-- Fix theme colors
vim.keymap.set('n', '<leader>st', ':syntax sync fromstart<CR>')

-- Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Change filetype
vim.keymap.set('n', '<leader>ft', function()
  local filetype = vim.fn.input 'Filetype: '
  if filetype == '' then
    return
  end

  local ok, msg = pcall(function()
    return vim.cmd('set filetype=' .. filetype)
  end)

  if not ok then
    print('An error occurred: ' .. msg)
  else
    print('Filetype set to ' .. filetype)
  end
end, { desc = 'Set filetype' })

-- Restart Lsp
vim.keymap.set('n', '<leader>rl', ':LspRestart<CR>', { desc = 'Restart LSP' })

-- Resize windows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { silent = true })
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { silent = true })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { silent = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { silent = true })

-- Prompt for google search
vim.keymap.set('n', '<leader>g', function()
  local search = vim.fn.input 'Google Search: '
  if search == '' then
    return
  end

  vim.fn.system('start chrome "https://www.google.com/search?q=' .. search .. '"')
end, { desc = 'Google Search' })
