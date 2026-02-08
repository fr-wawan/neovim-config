return {
  'vyfor/cord.nvim',
  build = ':Cord update',
  opts = {
    text = {
      workspace = function()
        return 'yang ytta ytta aja'
      end,
    },
  },
}
