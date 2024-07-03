-- Navigation around a buffer or split to anywhere you want without using
-- the mouse or a bunch of combined motions.
--
-- I could just use `/`, but that does have some issues with needing to
-- write a larger search query, along with chaning `n` to jump through matches.
-- This plugin allows short queries without the need to jump multiple matches.
return {
  "folke/flash.nvim",
  event = "VeryLazy",
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
