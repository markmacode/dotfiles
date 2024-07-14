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
    local luasnip = require("luasnip")

    require("custom.util").keys({
      {
        "<C-l>",
        function()
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
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          end
        end,
        desc = "Snippet cursor jump prev",
        mode = { "i", "s" },
        silent = true,
      },
    })

    luasnip.filetype_extend("javascriptreact", { "html" })
    luasnip.filetype_extend("typescriptreact", { "html" })
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
