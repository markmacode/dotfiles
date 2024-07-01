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
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
