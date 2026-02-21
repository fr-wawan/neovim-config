return {
  {
    'mbbill/undotree',
    cmd = { 'UndotreeToggle', 'UndotreeShow', 'UndotreeHide', 'UndotreeFocus' },
    keys = {
      { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'UndoTree toggle' },
    },
    init = function()
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
}
