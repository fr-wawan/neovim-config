vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10

vim.api.nvim_create_user_command('W', 'w', {})

-- Fungsi untuk edit file dan auto mkdir
local function edit_create_dir(file)
  local dir = vim.fn.fnamemodify(file, ':h') -- ambil path direktori
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, 'p') -- buat semua parent folder
  end
  vim.cmd('edit ' .. file) -- buka file
end

vim.api.nvim_create_user_command('E', function(opts)
  edit_create_dir(opts.args ~= '' and opts.args or vim.fn.input('Edit: ', '', 'file'))
end, { nargs = '?', complete = 'file' })
