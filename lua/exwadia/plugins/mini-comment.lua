return {
  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    opts = { -- these are the default options
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },
}
