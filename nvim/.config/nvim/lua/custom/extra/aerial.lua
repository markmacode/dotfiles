return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("aerial").setup({
      autojump = true,
      post_jump_cmd = "normal! zt",
      float = {
        relative = "win",
      },
      on_attach = function(bufnr)
        require("custom.util").keys({
          { "{", "<cmd>AerialPrev<cr>", buffer = bufnr, desc = "Previous symbol" },
          { "}", "<cmd>AerialNext<cr>", buffer = bufnr, desc = "Next symbol" },
          { "<leader>fo", "<cmd>AerialToggle!<cr>", desc = "File symbols outline" },
          { "<leader>so", "<cmd>AerialToggle float<cr>", desc = "Search symbols outline" },
        })
      end,
    })
  end,
}
