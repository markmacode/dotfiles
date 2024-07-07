return {
  "L3MON4D3/LuaSnip",
  version = "*",
  build = "make install_jsregexp",
  event = "VeryLazy",
  dependencies = {
    -- Enable compatibility with cmp
    "saadparwaiz1/cmp_luasnip",
    -- Snippets from VS Code are quite good
    "rafamadriz/friendly-snippets",
  },
  opts = function()
    require("custom.snippets")
  end,
}
