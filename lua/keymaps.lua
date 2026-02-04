-- Clear search highlight on escape
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Delete character with x without yanking
vim.keymap.set('n', 'x', '"_x')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

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
vim.keymap.set('n', '<leader>zh', ':split<Return>', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>zv', ':vsplit<Return>', { desc = 'Split window horizontally' })

-- Paste in visual mode: use upper-case P to avoid yanking the replaced text
vim.keymap.set('v', 'p', 'P')

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Buffer navigation - Tab/Shift-Tab for cycling
vim.keymap.set('n', '<tab>', function()
  require('bufferline').cycle(1)
end, { desc = 'Goto next buffer' })

vim.keymap.set('n', '<S-tab>', function()
  require('bufferline').cycle(-1)
end, { desc = 'Goto prev buffer' })

-- Buffer management
vim.keymap.set('n', '<leader>x', function()
  vim.cmd 'bwipeout!'
end, { desc = 'Close Buffer' })

vim.keymap.set('n', '<leader>xx', function()
  vim.cmd 'bufdo bd'
end, { desc = 'Close all buffers' })

-- NvimTree
vim.keymap.set('n', '<Leader>e', '<Cmd>NvimTreeToggle<CR>', { silent = true })
vim.keymap.set('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', { silent = true })

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

-- Toggle Relative line numbers
vim.keymap.set('n', '<leader>rl', function()
  vim.wo.relativenumber = not vim.wo.relativenumber
  print('Relative line numbers ' .. (vim.wo.relativenumber and 'enabled' or 'disabled'))
end, { desc = 'Toggle relative line numbers' })

-- Resize windows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { silent = true })
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { silent = true })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { silent = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { silent = true })

-- Open web browser with Google search
vim.keymap.set('n', '<leader>g', function()
  local search = vim.fn.input 'Google Search: '
  if search == '' then
    return
  end

  local open_cmd
  if vim.fn.has 'mac' == 1 then
    open_cmd = 'open'
  elseif vim.fn.has 'unix' == 1 then
    open_cmd = 'xdg-open'
  elseif vim.fn.has 'win32' == 1 then
    open_cmd = 'start'
  else
    vim.notify('Unsupported platform', vim.log.levels.WARN)
    return
  end

  local url = 'https://www.google.com/search?q=' .. vim.fn.shellescape(search)
  vim.fn.system(open_cmd .. ' ' .. vim.fn.shellescape(url))
end, { desc = 'Google Search' })

-- Copilot Chat toggle
vim.keymap.set('n', '<leader>cc', ':CopilotChatToggle<CR>', { desc = 'Copilot Chat' })
