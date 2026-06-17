return {
  'tpope/vim-rails',
  config = function()
    vim.g.rails_projections = {
      ['app/*.rb'] = {
        alternate = 'spec/{}_spec.rb',
      },
      ['app/*/*.rb'] = {
        alternate = 'spec/*/{}_spec.rb',
      },
      ['lib/*.rb'] = {
        alternate = 'spec/lib/{}_spec.rb',
      },
      ['lib/*/*.rb'] = {
        alternate = 'spec/lib/*/{}_spec.rb',
      },
    }
  end,
}
