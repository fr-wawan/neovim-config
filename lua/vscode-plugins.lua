require('lazy').setup({
  require 'exwadia.plugins.vim-matchit',
  require 'exwadia.plugins.mini',
  {
    'vscode-neovim/vscode-multi-cursor.nvim',
    event = 'VeryLazy',
    cond = not not vim.g.vscode,
    opts = {
      default_mappings = true,
    },
  },
}, {})
