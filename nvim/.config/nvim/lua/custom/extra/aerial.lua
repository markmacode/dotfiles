-- I needed a way to be able to navigation through document symbols.
-- Treesitter text objects should be able to handle that, but for various
-- reasons it is broken, and I dont want to make a PR to fix it.
return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("aerial").setup({
      on_attach = function(bufnr)
        require("custom.util").keys({
          { "(", "<cmd>AerialPrev<cr>", buffer = bufnr, desc = "Previous symbol" },
          { ")", "<cmd>AerialNext<cr>", buffer = bufnr, desc = "Next symbol" },
        })
      end,
    })
  end,
}
