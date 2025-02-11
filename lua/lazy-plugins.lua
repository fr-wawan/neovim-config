require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  require 'exwadia.plugins.telescope',

  require 'exwadia.plugins.lspconfig',

  require 'exwadia.plugins.vim-surround',

  require 'exwadia.plugins.vim-matchit',

  require 'exwadia.plugins.lualine',

  require 'exwadia.plugins.conform',

  require 'exwadia.plugins.cmp',

  require 'exwadia.plugins.colorscheme',

  require 'exwadia.plugins.highlight-colors',

  require 'exwadia.plugins.vim-abolish',

  require 'exwadia.plugins.todo-comments',

  require 'exwadia.plugins.treesitter',

  require 'exwadia.plugins.autotag',

  require 'exwadia.plugins.namespace',

  require 'exwadia.plugins.harpoon',

  require 'exwadia.plugins.copilot',

  require 'exwadia.plugins.commentstring',

  require 'exwadia.plugins.mini-comment',

  require 'exwadia.plugins.copilot-chat',

  require 'exwadia.plugins.vim-visual-multi',

  require 'exwadia.plugins.toggleterm',

  require 'exwadia.plugins.presence',

  -- require 'exwadia.plugins.lspsaga',

  -- require 'exwadia.plugins.focus',

  -- require 'exwadia.plugins.screenkey',

  -- require 'exwadia.plugins.debug',
  -- require 'exwadia.plugins.indent_line',
  require 'exwadia.plugins.lint',

  require 'exwadia.plugins.autopairs',

  require 'exwadia.plugins.neo-tree',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
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
