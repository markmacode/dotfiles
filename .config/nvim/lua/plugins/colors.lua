return {
  {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "e-q/okcolors.nvim",
    lazy = false,
    priority = 1000,
    name = "okcolors",
    opts = {},
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
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
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
      local mocha = require("catppuccin.palettes").get_palette("mocha")
      vim.api.nvim_set_hl(0, "IblScope", { fg = mocha.overlay2 })
      vim.api.nvim_set_hl(0, "IblIndent", { fg = mocha.surface1 })
      vim.api.nvim_set_hl(0, "Whitespace", { fg = mocha.overlay1 })
    end,
    opts = {},
    integrations = {
      neotree = true,
    },
  },
}
