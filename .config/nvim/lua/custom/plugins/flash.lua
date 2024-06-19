return {
  "folke/flash.nvim",
  lazy = true,
  opts = {},
  keys = function()
    local f = require("flash")
    return {
      { "s", mode = { "n", "x", "o" }, f.jump, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, f.treesitter, desc = "Flash Treesitter" },
      { "<c-s>", mode = { "c" }, f.toggle, desc = "Toggle Flash Search" },
    }
  end,
}
