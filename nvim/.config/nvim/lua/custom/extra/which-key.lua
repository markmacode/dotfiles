-- Always provides a way to remind you of keymaps that you may not use
-- often enough to remember 100% of the time. Helps discover/rediscover
-- and learn keymaps.
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function()
    require("which-key").add({
      { "<leader>b", group = "+Breakpoint" },
      { "<leader>c", group = "+Refactor" },
      { "<leader>d", group = "+Debug" },
      { "<leader>f", group = "+File" },
      { "<leader>l", group = "+LSP" },
      { "<leader>g", group = "+Git" },
      { "<leader>s", group = "+Search" },
      { "<leader>x", group = "+Trouble" },
      { "z", group = "+Fold" },
      { "\\", group = "+Toggle" },
      { "[", group = "+Prev" },
      { "]", group = "+Next" },
      {
        "<leader>?",
        function()
          require("which-key").show()
        end,
        desc = "Local keymaps (which-key)",
      },
    })
    return {
      preset = "modern",
    }
  end,
}
