-- I needed a way to be able to navigate through document symbols.
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
        vim.keymap.set("n", "(", "<cmd>AerialPrev<cr>", { desc = "Previous symbol" })
        vim.keymap.set("n", ")", "<cmd>AerialNext<cr>", { desc = "Next symbol" })
      end,
    })
  end,
}
