return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    require("which-key").register({
      ["<leader>a"] = { name = "+action/refactor" },
      ["<leader>l"] = { name = "+lsp" },
      ["<leader>f"] = { name = "+file/buffer" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>x"] = { name = "+quickfix/diagnostics" },
      ["["] = { name = "+prev" },
      ["]"] = { name = "+next" },
      ["z"] = { name = "+fold" },
    })
  end,
}
