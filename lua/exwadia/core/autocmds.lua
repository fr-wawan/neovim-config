local augroup = vim.api.nvim_create_augroup

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = augroup('exwadia-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('VimResized', {
  desc = 'Resize splits when window changes',
  group = augroup('exwadia-resize-splits', { clear = true }),
  callback = function()
    vim.cmd 'wincmd ='
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Blade goto definition helper',
  group = augroup('exwadia-ft-blade', { clear = true }),
  pattern = { 'blade' },
  callback = function(args)
    require('exwadia.ft.blade').setup(args.buf)
  end,
})
