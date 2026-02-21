return {
  {
    'folke/trouble.nvim',
    cmd = { 'Trouble' },
    opts = {},
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Trouble diagnostics' },
      { '<leader>xq', '<cmd>Trouble qflist toggle<cr>', desc = 'Trouble quickfix' },
      { '<leader>xl', '<cmd>Trouble loclist toggle<cr>', desc = 'Trouble loclist' },
    },
  },
}
