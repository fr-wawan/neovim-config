require('lazy').setup({
  require 'exwadia.plugins.vim-surround',
  require 'exwadia.plugins.vim-matchit',
  require 'exwadia.plugins.presence',
  {
    'vscode-neovim/vscode-multi-cursor.nvim',
    event = 'VeryLazy',
    cond = not not vim.g.vscode,
    opts = {
      default_mappings = true,
    },
  },
}, {})
