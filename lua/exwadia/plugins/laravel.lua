return {
  -- Vim syntax highlighting for Blade templates.
  -- https://github.com/jwalton512/vim-blade
  {
    'jwalton512/vim-blade',
    ft = { 'blade', 'php' },
  },

  {
    -- Add the blade-nav.nvim plugin which provides Goto File capabilities
    -- for Blade files.
    'ricardoramirezr/blade-nav.nvim',
    ft = { 'blade', 'php' },
  },

  -- tree-sitter grammar for Laravel blade files
  -- https://github.com/EmranMR/tree-sitter-blade
  -- {
  --   'EmranMR/tree-sitter-blade',
  --   dependencies = { 'nvim-treesitter/nvim-treesitter' },
  --   ft = { 'blade' },
  -- },
}
