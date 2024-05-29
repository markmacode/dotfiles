return {
  {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme("gruvbox")
      -- unset ugly grey sign column color
      vim.api.nvim_command("hi SignColumn guibg=NONE ctermbg=NONE")
    end,
  },
  "folke/tokyonight.nvim",
  "e-q/okcolors.nvim",
  "EdenEast/nightfox.nvim",
  { "catppuccin/nvim", name = "catppuccin" },
}
