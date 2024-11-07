-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('i', 'jj', '<Esc>')
vim.api.nvim_set_keymap('i', '<M-CR>', 'copilot#Accept("<CR>")', { expr = true, noremap = true, silent = true })
vim.g.copilot_no_tab_map = true
-- Normal mode keybindings
vim.keymap.set('n', '<C-h>', ':tabp<CR>')
vim.keymap.set('n', '<C-l>', ':tabn<CR>')
vim.keymap.set('n', '<C-o>', '<C-^>')

vim.keymap.set('n', '<leader>e', ':Ex<CR>')
-- Normal mode non-recursive keybindings
vim.keymap.set('n', 'u', ':undo<CR>')
vim.keymap.set('n', '<C-r>', ':redo<CR>')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<S-h>', '')
vim.keymap.set('n', '<S-l>', '')
vim.keymap.set('n', '<leader>v', ':vsplit<CR>')
vim.keymap.set('n', '<leader>h', ':lua vim.cmd("wincmd h")<CR>')
vim.keymap.set('n', '<leader>j', ':lua vim.cmd("wincmd j")<CR>')
vim.keymap.set('n', '<leader>k', ':lua vim.cmd("wincmd k")<CR>')
vim.keymap.set('n', '<leader>l', ':lua vim.cmd("wincmd l")<CR>')
vim.keymap.set('n', '<leader>n', ':lua vim.cmd("EmmetMatchTag")<CR>')
vim.keymap.set('n', '<leader>w', ':w!<CR>')
vim.keymap.set('n', '<leader>q', ':q!<CR>')
vim.keymap.set('n', '<leader>x', ':lua vim.cmd("close")<CR>')
vim.keymap.set('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<leader>f', ':lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '<leader>p', ':lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', 'gh', ':lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gj', ':lua vim.lsp.buf.definition()<CR>')

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
local function lsp_organize_imports()
  local params = { command = '_typescript.organizeImports', arguments = { vim.api.nvim_buf_get_name(0) }, title = '' }
  vim.lsp.buf.execute_command(params)
end

vim.keymap.set('n', '<M-S-o>', lsp_organize_imports, { noremap = true, silent = true })
