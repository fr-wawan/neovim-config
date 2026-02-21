if vim.g.vscode then
  require 'vscode-keymaps'
  require 'lazy-bootstrap'
  require 'vscode-options'
  require 'vscode-plugins'
  return
end

-- Must be set before plugins are loaded.
require 'exwadia.core.globals'

require 'exwadia.core.options'
require 'exwadia.core.keymaps'
require 'exwadia.core.autocmds'

require 'lazy-bootstrap'
require 'lazy-plugins'

-- vim: ts=2 sts=2 sw=2 et
