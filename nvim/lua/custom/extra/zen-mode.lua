-- Mainly to edit markdown files, this will narrow the width
-- so I don't have to read sentences 200 cols wide.
-- Also good for doing split views but the code you're working with
-- on 1 window is a bit too narrow, this will widen the screen.
return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      width = 100,
    },
  },
  config = function()
    local zen = require("zen-mode")
    vim.keymap.set("n", "<leader>z", zen.toggle, { desc = "Zen mode" })
  end,
}
