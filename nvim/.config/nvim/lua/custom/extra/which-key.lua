-- Always provides a way to remind you of keymaps that you may not use
-- often enough to remember 100% of the time. Helps discover/rediscover
-- and learn keymaps.
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
      ["<leader>x"] = { name = "+trouble/explore" },
      ["["] = { name = "+prev" },
      ["]"] = { name = "+next" },
      ["<up>"] = { name = "+prev" },
      ["<down>"] = { name = "+next" },
      ["z"] = { name = "+fold" },
    })
  end,
}
