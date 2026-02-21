-- =============================================================================
-- KEYMAPS
-- =============================================================================

-- -----------------------------------------------------------------------------
-- General
-- -----------------------------------------------------------------------------
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<M-o>', '<C-^>', { desc = 'Switch to last buffer' })
vim.keymap.set('n', '<leader>v', '<cmd>vsplit<CR>', { desc = 'Vertical split' })
vim.keymap.set('n', '<leader>x', '<cmd>close<CR>', { desc = 'Close window' })

-- -----------------------------------------------------------------------------
-- Window Navigation
-- -----------------------------------------------------------------------------
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Focus left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Focus right window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Focus lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Focus upper window' })

-- Window resize
vim.keymap.set('n', '<M-Up>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<M-Down>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<M-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<M-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })

-- -----------------------------------------------------------------------------
-- Buffer
-- -----------------------------------------------------------------------------
vim.keymap.set('n', '<leader>bo', '<cmd>%bd|e#<CR>', { desc = 'Close all buffers except current' })

-- -----------------------------------------------------------------------------
-- Editing QoL
-- -----------------------------------------------------------------------------
-- Move lines in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Keep cursor centered
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Indent and stay in visual mode
vim.keymap.set('v', '<', '<gv', { desc = 'Outdent' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent' })

-- Paste without losing register
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste without overwriting register' })

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank line to clipboard' })

-- Delete to void register
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete to void' })

-- Better save
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save' })
vim.keymap.set('n', '<leader>W', '<cmd>wa<CR>', { desc = 'Save all' })

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', { desc = 'Select all' })

-- Duplicate line
vim.keymap.set('n', '<leader>dl', '<cmd>t.<CR>', { desc = 'Duplicate line' })

-- -----------------------------------------------------------------------------
-- Search & Replace (vim-abolish)
-- -----------------------------------------------------------------------------
-- crs=snake_case | crc=camelCase | crm=MixedCase | cru=UPPER_CASE | cr-=dash-case
vim.keymap.set('n', '<leader>?r', '<cmd>echo "crs=snake | crc=camel | crm=mixed | cru=UPPER | cr-=dash | cr.=dot"<CR>', { desc = 'Coerce cheatsheet' })

-- Case-aware replace word under cursor
vim.keymap.set('n', '<leader>rr', ':%S/<C-r><C-w>/<C-r><C-w>/g<Left><Left>', { desc = 'Replace word (case-aware)' })
vim.keymap.set('n', '<leader>rc', ':%S/<C-r><C-w>/<C-r><C-w>/gc<Left><Left><Left>', { desc = 'Replace word (case-aware, confirm)' })

-- Exact replace word under cursor
vim.keymap.set('n', '<leader>rs', ':%s/<C-r><C-w>/<C-r><C-w>/gc<Left><Left><Left>', { desc = 'Replace word (exact, confirm)' })

-- -----------------------------------------------------------------------------
-- LSP
-- -----------------------------------------------------------------------------
vim.keymap.set('n', '<M-r>', '<cmd>LspRestart<CR>', { desc = 'Restart LSP' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic quickfix list' })

-- -----------------------------------------------------------------------------
-- Diagnostic navigation
-- -----------------------------------------------------------------------------
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

-- -----------------------------------------------------------------------------
-- Terminal
-- -----------------------------------------------------------------------------
vim.keymap.set({ 'n', 't' }, '<C-\\>', function()
  if vim.bo.buftype == 'terminal' then
    vim.cmd 'hide'
  else
    local term_buf = vim.fn.bufnr 'term://'
    if term_buf ~= -1 then
      vim.cmd 'botright split'
      vim.cmd 'resize 15'
      vim.api.nvim_set_current_buf(term_buf)
      vim.cmd 'startinsert'
    else
      vim.cmd 'botright split | terminal'
      vim.cmd 'resize 15'
      vim.cmd 'startinsert'
    end
  end
end, { desc = 'Toggle terminal' })

vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })

-- Window nav from terminal mode
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]])
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]])
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]])
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]])

-- -----------------------------------------------------------------------------
-- Tmux
-- -----------------------------------------------------------------------------
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>', { desc = 'Tmux sessionizer' })

-- -----------------------------------------------------------------------------
-- Copilot
-- -----------------------------------------------------------------------------
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', '<M-CR>', 'copilot#Accept("<CR>")', { expr = true, noremap = true, silent = true })

-- -----------------------------------------------------------------------------
-- Autocommands
-- -----------------------------------------------------------------------------
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
