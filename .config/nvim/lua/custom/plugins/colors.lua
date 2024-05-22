return {
  {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  "folke/tokyonight.nvim",
  "e-q/okcolors.nvim",
  "EdenEast/nightfox.nvim",
  { "catppuccin/nvim", name = "catppuccin" },
}
