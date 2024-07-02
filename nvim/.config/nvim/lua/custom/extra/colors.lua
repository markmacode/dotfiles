return {
  {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- unset ugly grey sign column color
      vim.api.nvim_command("hi SignColumn guibg=NONE ctermbg=NONE")
      vim.api.nvim_command("hi MiniIndentscopeSymbol guifg='#bdae93'")
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        style = "moon",
        on_highlights = function(hl, c)
          hl.LineNrAbove = { bg = c.bg, fg = c.comment }
          hl.LineNrBelow = { bg = c.bg, fg = c.comment }
        end,
      }
    end,
  },
}
