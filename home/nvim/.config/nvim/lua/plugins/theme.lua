-- This is a comment
return {
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'duskfox'
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
}
