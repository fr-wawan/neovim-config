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

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Open home (mini.starter) when launching with no file',
  group = augroup('exwadia-home', { clear = true }),
  callback = function()
    if vim.fn.argc() ~= 0 then
      return
    end

    local buf = vim.api.nvim_get_current_buf()
    if vim.bo[buf].buftype ~= '' then
      return
    end

    if vim.api.nvim_buf_get_name(buf) ~= '' then
      return
    end

    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    if #lines > 1 or (#lines == 1 and lines[1] ~= '') then
      return
    end

    pcall(function()
      require('mini.starter').open()
    end)
  end,
})
