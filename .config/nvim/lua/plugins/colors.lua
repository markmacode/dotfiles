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
    end,
    opts = {
      custom_highlights = function(colors)
        return {
          ["@parameter"] = { style = { "italic" } },
          ["IblScope"] = { fg = colors.overlay0 },
        }
      end,
    },
    integrations = {
      neotree = true,
    },
  },
}
