-- Mainly to edit markdown files, this will narrow the width
-- so I don't have to read sentences 200 cols wide.
return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      width = 100, -- width of the Zen window
    },
  },
  config = function()
    local zen = require("zen-mode")
    require("custom.util").keys({
      { "<leader>fz", zen.toggle, desc = "File zen mode" },
    })
  end,
}
