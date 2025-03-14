require('lazy').setup({
  require 'exwadia.plugins.vim-surround',
  {
    'vscode-neovim/vscode-multi-cursor.nvim',
    event = 'VeryLazy',
    cond = not not vim.g.vscode,
    opts = {}
  },

}, {
})

-- vim: ts=2 sts=2 sw=2 et
