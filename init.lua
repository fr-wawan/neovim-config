if vim.g.vscode then
  require 'vscode_keybinds'
  -- [[ Install `lazy.nvim` plugin manager ]]
  require 'lazy-bootstrap'

  require 'vscode_options'

  require 'vscode_plugins'

else
  -- Set <space> as the leader key
  -- See `:help mapleader`
  --  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  -- Set to true if you have a Nerd Font installed and selected in the terminal
  vim.g.have_nerd_font = false

  -- [[ Setting options ]]
  require 'options'

  -- [[ Basic Keymaps ]]
  require 'keymaps'

  -- [[ Install `lazy.nvim` plugin manager ]]
  require 'lazy-bootstrap'

  -- [[ Configure and install plugins ]]
  require 'lazy-plugins'

  -- The line beneath this is called `modeline`. See `:help modeline`
  -- vim: ts=2 sts=2 sw=2 et
end
