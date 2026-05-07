return {
  -- Dart syntax highlighting
  { 'dart-lang/dart-vim-plugin' },

  -- Main flutter plugin
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    config = function()
      require('flutter-tools').setup {
        pub_get_on_pubspec_change = false,
        widget_guides = { enabled = true },
        decorations = {
          statusline = {
            app_version = true,
            device = true,
          },
        },
        dev_tools = {
          autostart = true,
          auto_open_browser = false,
        },
        lsp = {
          color = { enabled = true }, -- highlight warna dart variables
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            updateImportsOnRename = true,
          },
        },
      }

      -- Keymaps
      local map = vim.keymap.set
      map('n', '<leader>fr', ':FlutterRun<CR>', { desc = 'Flutter Run' })
      map('n', '<leader>fq', ':FlutterQuit<CR>', { desc = 'Flutter Quit' })
      map('n', '<leader>fR', ':FlutterRestart<CR>', { desc = 'Flutter Restart' })
      map('n', '<leader>fh', ':FlutterReload<CR>', { desc = 'Flutter Hot Reload' })
      map('n', '<leader>fd', ':FlutterDevices<CR>', { desc = 'Flutter Devices' })
      map('n', '<leader>fD', ':FlutterDevTools<CR>', { desc = 'Flutter DevTools' })
      map('n', '<leader>fo', ':FlutterOutlineToggle<CR>', { desc = 'Flutter Outline' })
      map('n', '<leader>fl', ':FlutterLspRestart<CR>', { desc = 'Restart LSP' })
    end,
  },
}
