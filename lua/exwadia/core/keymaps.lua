local map = vim.keymap.set

-- General
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('i', 'jj', '<Esc>')
map('n', '<M-o>', '<C-^>', { desc = 'Switch to last buffer' })

-- Windows
map('n', '<C-h>', '<C-w>h', { desc = 'Focus left window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Focus right window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Focus lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Focus upper window' })

map('n', '<leader>v', '<cmd>vsplit<CR>', { desc = 'Vertical split' })
map('n', '<leader>h', '<cmd>split<CR>', { desc = 'Horizontal split' })
map('n', '<leader>=', '<cmd>wincmd =<CR>', { desc = 'Equalize splits' })
map('n', '<leader>x', '<cmd>close<CR>', { desc = 'Close window' })

map('n', '<M-Up>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })
map('n', '<M-Down>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<M-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<M-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })

-- Buffers
map('n', '<S-h>', '<cmd>bprevious<CR>', { desc = 'Prev buffer' })
map('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
map('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })
map('n', '<leader>bo', '<cmd>%bd|e#<CR>', { desc = 'Close all but current buffer' })

-- Editing QoL
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

map('n', 'J', 'mzJ`z')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

map('v', '<', '<gv', { desc = 'Outdent' })
map('v', '>', '>gv', { desc = 'Indent' })

map('x', '<leader>p', [["_dP]], { desc = 'Paste without overwriting register' })
map({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to clipboard' })
map('n', '<leader>Y', [["+Y]], { desc = 'Yank line to clipboard' })
map({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete to void register' })

map({ 'n', 'i', 'v' }, '<C-s>', function()
  if vim.fn.mode() == 'i' then
    vim.cmd 'stopinsert'
  end
  vim.cmd 'write'
end, { desc = 'Save file' })

map('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save' })
map('n', '<leader>W', '<cmd>wa<CR>', { desc = 'Save all' })
map('n', '<leader>qq', '<cmd>qa<CR>', { desc = 'Quit all' })
map('n', '<leader>va', 'gg<S-v>G', { desc = 'Select all' })
map('n', '<leader>dl', '<cmd>t.<CR>', { desc = 'Duplicate line' })

-- Search/replace (vim-abolish)
map('n', '<leader>?r', '<cmd>echo "crs=snake | crc=camel | crm=mixed | cru=UPPER | cr-=dash | cr.=dot"<CR>', { desc = 'Abolish coerce help' })
map('n', '<leader>rr', ':%S/<C-r><C-w>/<C-r><C-w>/g<Left><Left>', { desc = 'Replace word (case-aware)' })
map('n', '<leader>rc', ':%S/<C-r><C-w>/<C-r><C-w>/gc<Left><Left><Left>', { desc = 'Replace word (case-aware, confirm)' })
map('n', '<leader>rs', ':%s/<C-r><C-w>/<C-r><C-w>/gc<Left><Left><Left>', { desc = 'Replace word (exact, confirm)' })

-- Diagnostics
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostics to loclist' })
map('n', '<leader>Q', vim.diagnostic.setqflist, { desc = 'Diagnostics to quickfix' })
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev diagnostic' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
map('n', 'gl', vim.diagnostic.open_float, { desc = 'Line diagnostics' })

-- LSP utility
map('n', '<M-r>', '<cmd>LspRestart<CR>', { desc = 'Restart LSP' })

-- Terminal (built-in)
map({ 'n', 't' }, '<C-\\>', function()
  if vim.bo.buftype == 'terminal' then
    vim.cmd 'hide'
    return
  end

  local term_buf = vim.fn.bufnr 'term://'
  if term_buf ~= -1 then
    vim.cmd 'botright split'
    vim.cmd 'resize 15'
    vim.api.nvim_set_current_buf(term_buf)
    vim.cmd 'startinsert'
    return
  end

  vim.cmd 'botright split | terminal'
  vim.cmd 'resize 15'
  vim.cmd 'startinsert'
end, { desc = 'Toggle terminal' })

map('t', '<Esc><Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
map('t', '<C-h>', [[<C-\><C-n><C-w>h]])
map('t', '<C-j>', [[<C-\><C-n><C-w>j]])
map('t', '<C-k>', [[<C-\><C-n><C-w>k]])
map('t', '<C-l>', [[<C-\><C-n><C-w>l]])

-- Tmux
map('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>', { desc = 'Tmux sessionizer' })

-- Home
map('n', '<leader>oh', '<cmd>lua require("mini.starter").open()<CR>', { desc = 'Open home' })

-- Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', '<M-CR>', 'copilot#Accept("<CR>")', { expr = true, noremap = true, silent = true })
