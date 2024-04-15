return {
  {
    "f-person/auto-dark-mode.nvim",
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
        vim.cmd.colorscheme 'nightfox'
      end,
      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
        vim.cmd.colorscheme 'dayfox'
      end,
    },
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    opts = {
      options = {
        styles = {
          comments = "italic",
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
