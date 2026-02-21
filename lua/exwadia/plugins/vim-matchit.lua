return {
  'andymass/vim-matchup',
  init = function()
    vim.g.matchup_matchparen_deferred = 1
    vim.g.matchup_matchparen_enabled = 0
  end,
}
