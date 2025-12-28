-- Use a single motion to alter or add surrounding characters. This stops
-- the need to use a bunch of different motions to do this, which can be
-- particularly frustrating with the combination of auto pair plugins.
return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({})
  end,
}
