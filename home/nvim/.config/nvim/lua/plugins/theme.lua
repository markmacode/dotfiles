return {
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'nightfox'
      vim.cmd [[highlight colorcolumn guibg='#1C2836']]
    end,
  },
}
