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
  keys = {
    {
      "<C-l>",
      function()
        local luasnip = require("luasnip")
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        end
      end,
      desc = "Snippet cursor next",
      mode = { "i", "s" },
      silent = true,
    },
    {
      "<C-h>",
      function()
        local luasnip = require("luasnip")
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        end
      end,
      desc = "Snippet cursor jump prev",
      mode = { "i", "s" },
      silent = true,
    },
  },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
