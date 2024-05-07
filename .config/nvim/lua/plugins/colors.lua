return {
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
    config = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
    opts = {
      dark = 'mocha',
      light = 'latte',
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
