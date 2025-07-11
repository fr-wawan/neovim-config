require('lazy').setup({
  'NMAC427/guess-indent.nvim',

  require 'exwadia.plugins.gitsigns',

  require 'exwadia.plugins.telescope',

  require 'exwadia.plugins.lspconfig',

  require 'exwadia.plugins.vim-surround',

  require 'exwadia.plugins.vim-matchit',

  require 'exwadia.plugins.conform',

  require 'exwadia.plugins.cmp',

  require 'exwadia.plugins.highlight-color',

  -- require 'exwadia.plugins.vim-abolish',

  require 'exwadia.plugins.autotag',

  require 'exwadia.plugins.namespace',

  require 'exwadia.plugins.harpoon',

  require 'exwadia.plugins.copilot',

  -- require 'exwadia.plugins.copilot-chat',

  require 'exwadia.plugins.vim-visual-multi',

  require 'exwadia.plugins.toggleterm',

  require 'exwadia.plugins.commentstring',

  require 'exwadia.plugins.toggleterm',

  require 'exwadia.plugins.presence',

  require 'exwadia.plugins.colorscheme',

  require 'exwadia.plugins.todo-comments',

  require 'exwadia.plugins.mini',

  require 'exwadia.plugins.treesitter',

  require 'exwadia.plugins.lint',

  require 'exwadia.plugins.autopairs',

  require 'exwadia.plugins.neo-tree',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
