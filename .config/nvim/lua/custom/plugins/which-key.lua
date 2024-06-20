return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = function()
    require("which-key").register({
      ["<leader>a"] = { name = "+action/refactor" },
      ["<leader>as"] = { name = "+surround" },
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
