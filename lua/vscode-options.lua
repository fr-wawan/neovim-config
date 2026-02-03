vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.api.nvim_create_user_command('W', 'w', {})

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
