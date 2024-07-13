-- Always provides a way to remind you of keymaps that you may not use
-- often enough to remember 100% of the time. Helps discover/rediscover
-- and learn keymaps.
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function()
    require("which-key").add({
      { "<leader>a", group = "+action/refactor" },
      { "<leader>c", group = "+quickfix" },
      { "<leader>l", group = "+lsp" },
      { "<leader>f", group = "+file/buffer" },
      { "<leader>g", group = "+git" },
      { "<leader>s", group = "+search" },
      { "<leader>x", group = "+trouble/explore" },
      { "[", group = "+prev" },
      { "]", group = "+next" },
      { "<up>", group = "+prev" },
      { "<down>", group = "+next" },
      { "z", group = "+fold" },
    })
    return {
      preset = "helix",
    }
  end,
}
