return {
  {
    'echasnovski/mini.nvim',
    version = false,
    event = 'VeryLazy',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()

      local starter = require 'mini.starter'
      starter.setup {
        evaluate_single = true,
        header = table.concat({
          '     _   __                _           ',
          '    / | / /__  ____ _   __(_)___ ___    ',
          '   /  |/ / _ \\ / __ \\ | / / / __ `__ \\   ',
          '  / /|  /  __/ /_/ / |/ / / / / / / /   ',
          ' /_/ |_|\\___/\\____/|___/_/_/ /_/ /_/    ',
        }, '\n'),
        items = {
          {
            name = 'New file',
            action = 'enew',
            section = 'Actions',
          },
          {
            name = 'Find files',
            action = "lua require('telescope.builtin').find_files()",
            section = 'Actions',
          },
          {
            name = 'Live grep',
            action = "lua require('telescope.builtin').live_grep()",
            section = 'Actions',
          },
          {
            name = 'Recent files',
            action = "lua require('telescope').extensions['recent-files'].recent_files({ hidden = true })",
            section = 'Actions',
          },
          {
            name = 'File manager (Yazi)',
            action = 'Yazi',
            section = 'Actions',
          },
          {
            name = 'Edit config',
            action = "lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })",
            section = 'Config',
          },
          {
            name = 'Lazy',
            action = 'Lazy',
            section = 'Config',
          },
          {
            name = 'Quit',
            action = 'qa',
            section = 'Actions',
          },
          starter.sections.recent_files(10, false, true),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet('• ', false),
          starter.gen_hook.indexing('all', { 'Recent files' }),
          starter.gen_hook.aligning('center', 'center'),
        },
      }
    end,
  },
}
