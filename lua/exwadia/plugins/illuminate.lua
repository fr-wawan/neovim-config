return {
  {
    'RRethy/vim-illuminate',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      min_count_to_highlight = 2,
    },
    config = function(_, opts)
      require('illuminate').configure(opts)

      vim.keymap.set('n', ']r', function()
        require('illuminate').goto_next_reference(false)
      end, { desc = 'Next reference' })
      vim.keymap.set('n', '[r', function()
        require('illuminate').goto_prev_reference(false)
      end, { desc = 'Prev reference' })
    end,
  },
}
