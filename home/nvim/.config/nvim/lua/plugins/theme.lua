-- This is a comment
return {
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'nightfox'
      -- vim.cmd [[highlight colorcolumn guibg='#1C2836']]
    end,
    opts = {
      options = {
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic",
        },
      },
    },
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    ops = {},
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    ops = {},
  },
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    ops = {},
  },
}
