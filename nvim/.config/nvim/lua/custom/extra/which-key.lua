return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    require("which-key").register({
      ["<leader>a"] = { name = "+action/refactor" },
      ["<leader>c"] = { name = "+quickfix" },
      ["<leader>l"] = { name = "+lsp" },
      ["<leader>f"] = { name = "+file/buffer" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>x"] = { name = "+diagnostics" },
      ["["] = { name = "+prev" },
      ["]"] = { name = "+next" },
      ["<up>"] = { name = "+prev" },
      ["<down>"] = { name = "+next" },
      ["z"] = { name = "+fold" },
    })
  end,
}
