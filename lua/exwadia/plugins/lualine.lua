-- ═══════════════════════════════════════════════════════════════════════════
--  lualine.lua — One Dark statusline
--  ~/.config/nvim/lua/plugins/lualine.lua
-- ═══════════════════════════════════════════════════════════════════════════

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    -- ─── One Dark Colors ──────────────────────────────────────────────────
    local colors = {
      bg = '#21252b',
      bg_alt = '#282c34',
      surface = '#2c313a',
      border = '#3e4451',
      fg = '#abb2bf',
      fg_dim = '#636d83',
      fg_bright = '#dde1e8',
      red = '#e06c75',
      orange = '#d19a66',
      yellow = '#e5c07b',
      green = '#98c379',
      cyan = '#56b6c2',
      blue = '#61afef',
      purple = '#c678dd',
    }

    -- ─── Custom Theme ─────────────────────────────────────────────────────
    local one_dark = {
      normal = {
        a = { fg = colors.bg, bg = colors.blue, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.surface },
        c = { fg = colors.fg_dim, bg = colors.bg },
      },
      insert = {
        a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.surface },
        c = { fg = colors.fg_dim, bg = colors.bg },
      },
      visual = {
        a = { fg = colors.bg, bg = colors.purple, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.surface },
        c = { fg = colors.fg_dim, bg = colors.bg },
      },
      replace = {
        a = { fg = colors.bg, bg = colors.red, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.surface },
        c = { fg = colors.fg_dim, bg = colors.bg },
      },
      command = {
        a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.surface },
        c = { fg = colors.fg_dim, bg = colors.bg },
      },
      terminal = {
        a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.surface },
        c = { fg = colors.fg_dim, bg = colors.bg },
      },
      inactive = {
        a = { fg = colors.fg_dim, bg = colors.bg_alt },
        b = { fg = colors.fg_dim, bg = colors.bg_alt },
        c = { fg = colors.fg_dim, bg = colors.bg_alt },
      },
    }

    -- ─── Custom Components ────────────────────────────────────────────────

    -- Git branch dengan icon
    local branch = {
      'branch',
      icon = '',
      color = { fg = colors.purple, gui = 'bold' },
    }

    -- Git diff (added/changed/removed)
    local diff = {
      'diff',
      symbols = { added = ' ', modified = ' ', removed = ' ' },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.yellow },
        removed = { fg = colors.red },
      },
    }

    -- LSP diagnostics
    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_lsp', 'nvim_diagnostic' },
      sections = { 'error', 'warn', 'info', 'hint' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌶 ' },
      diagnostics_color = {
        error = { fg = colors.red },
        warn = { fg = colors.yellow },
        info = { fg = colors.cyan },
        hint = { fg = colors.fg_dim },
      },
      update_in_insert = false,
    }

    -- Filetype dengan icon
    local filetype = {
      'filetype',
      icon_only = false,
      colored = true,
      color = { fg = colors.fg, bg = colors.surface },
    }

    -- File encoding — hanya tampil kalau bukan utf-8
    local encoding = {
      'encoding',
      cond = function()
        return (vim.bo.fileencoding or vim.o.encoding) ~= 'utf-8'
      end,
      color = { fg = colors.orange },
    }

    -- File format — hanya tampil kalau bukan unix
    local fileformat = {
      'fileformat',
      symbols = { unix = '', dos = '', mac = '' },
      cond = function()
        return vim.bo.fileformat ~= 'unix'
      end,
      color = { fg = colors.orange },
    }

    -- LSP server name(s) yang aktif
    local lsp_name = {
      function()
        local clients = vim.lsp.get_clients { bufnr = 0 }
        if #clients == 0 then
          return '󰅦 No LSP'
        end
        local names = {}
        for _, c in ipairs(clients) do
          if c.name ~= 'null-ls' and c.name ~= 'copilot' then
            table.insert(names, c.name)
          end
        end
        return #names > 0 and ('󰒍 ' .. table.concat(names, ', ')) or '󰅦 No LSP'
      end,
      color = { fg = colors.cyan, gui = 'italic' },
    }

    -- Scroll progress — bar style
    local scrollbar = {
      function()
        local bars = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
        local line = vim.api.nvim_win_get_cursor(0)[1]
        local total = vim.api.nvim_buf_line_count(0)
        local idx = math.floor((line - 1) / total * #bars) + 1
        return bars[math.min(idx, #bars)]
      end,
      color = { fg = colors.blue, bg = colors.bg },
      padding = { left = 0, right = 1 },
    }

    -- ─── Setup ────────────────────────────────────────────────────────────
    require('lualine').setup {
      options = {
        theme = one_dark,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true, -- satu statusline untuk semua window
        refresh = {
          statusline = 1000,
          tabline = 1000,
        },
      },

      sections = {
        -- Kiri
        lualine_a = { 'mode' },
        lualine_b = { branch, diff },
        lualine_c = {
          {
            'filename',
            path = 1, -- relative path
            symbols = {
              modified = '  ',
              readonly = '  ',
              unnamed = ' 󰡯 No Name',
            },
          },
          diagnostics,
        },

        -- Kanan
        lualine_x = { lsp_name, encoding, fileformat, filetype },
        lualine_y = {
          { 'progress', color = { fg = colors.fg, gui = 'bold' } },
          { 'location', color = { fg = colors.fg_dim } },
        },
        lualine_z = { scrollbar },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },

      -- Winbar — nama file di atas tiap window (opsional, hapus kalau tidak mau)
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            path = 1,
            color = { fg = colors.fg_dim, bg = 'NONE', gui = 'italic' },
            symbols = { modified = '  ', readonly = '  ' },
          },
        },
        lualine_x = { diagnostics },
        lualine_y = {},
        lualine_z = {},
      },

      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            path = 1,
            color = { fg = colors.border, bg = 'NONE', gui = 'italic' },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },

      extensions = {
        'neo-tree',
        'lazy',
        'mason',
        'trouble',
        'quickfix',
        'fugitive',
      },
    }
  end,
}
