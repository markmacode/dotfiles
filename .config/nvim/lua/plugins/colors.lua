return {
  {
    "f-person/auto-dark-mode.nvim",
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
        vim.cmd.colorscheme 'catppuccin-mocha'
      end,
      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
        vim.cmd.colorscheme 'catppuccin-latte'
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
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
    opts = {
      custom_highlights = function(colors)
        return {
          ['@parameter'] = { style = { 'italic' } },
          ['IblScope'] = { fg = colors.overlay0 },
          ['NeoTreeNormal'] = { bg = colors.mantle },
          ['NeoTreeNormalNC'] = { bg = colors.mantle },
        }
      end
    },
    integrations = {
      neotree = true,
    },
  },
}
