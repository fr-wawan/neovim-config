local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- remap leader key
keymap('n', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<C-h>', ':tabp<CR>')
vim.keymap.set('n', '<C-l>', ':tabn<CR>')

vim.keymap.set('n', '<S-h>', '')
vim.keymap.set('n', '<S-l>', '')

-- editor splitting stuff
keymap('n', '<leader>v', "<cmd>lua require('vscode').action('workbench.action.splitEditor')<CR>", opts)
vim.keymap.set('n', '<leader>l', "<cmd>lua require('vscode').action('workbench.action.focusRightGroup')<CR>")
vim.keymap.set('n', '<leader>h', "<cmd>lua require('vscode').action('workbench.action.focusLeftGroup')<CR>")
vim.keymap.set('n', '<leader>j', "<cmd>lua require('vscode').action('workbench.action.focusBelowGroup')<CR>")
vim.keymap.set('n', '<leader>x', function()
  require('vscode').call 'workbench.action.closeEditorsInGroup'
end)
vim.keymap.set('n', '<leader>k', "<cmd>lua require('vscode').action('workbench.action.focusAboveGroup')<CR>")
vim.keymap.set('n', '[d', "<cmd>lua require('vscode').action('editor.action.marker.prev')<CR>")
vim.keymap.set('n', ']d', "<cmd>lua require('vscode').action('editor.action.marker.next')<CR>")
keymap({ 'n', 'v' }, '<leader>t', "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'J', 'mzJ`z')

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.keymap.set('x', '<leader>p', [["_dP]])
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

local SCROLL_LINES = 8

local function scroll_and_center(key)
  vim.api.nvim_feedkeys(SCROLL_LINES .. key, 'n', false)
  vim.schedule(function()
    vim.api.nvim_feedkeys('zz', 'n', false)
  end)
end

vim.keymap.set({ 'n', 'x' }, '<C-d>', function()
  scroll_and_center 'j'
end)

vim.keymap.set({ 'n', 'x' }, '<C-u>', function()
  scroll_and_center 'k'
end)

-- definition etc
keymap({ 'n', 'v' }, 'gj', "<cmd>lua require('vscode').action('editor.action.revealDefinition')<CR>", opts)
keymap({ 'n', 'v' }, 'gl', "<cmd>lua require('vscode').action('editor.action.openLink')<CR>", opts)
keymap({ 'n', 'v' }, '<leader>ca', "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({ 'n', 'v' }, '<leader>sp', "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({ 'n', 'v' }, '<leader>cn', "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap({ 'n', 'v' }, '<leader>ff', "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({ 'n', 'v' }, '<leader>cp', "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap({ 'n', 'v' }, '<leader>pr', "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap({ 'n', 'v' }, '<leader>fd', "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")

vim.keymap.set({ 'n', 'x', 'i', 'v' }, '<C-n>', function()
  require('vscode-multi-cursor').addSelectionToNextFindMatch()
end)

vim.keymap.set('x', '<leader>p', [["_dP]])

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])
