return {
  "hrsh7th/nvim-cmp",
  version = false,
  dependencies = {
    -- Snippet engine
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",

    -- Extra sources to make life easy
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  opts = function()
    local cmp = require("cmp")
    cmp.setup({
      -- The order of the sources will set the order of snippets
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "lazydev", group_index = 0 },
      }),

      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<Tab>"] = cmp.mapping(cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        })),
      }),

      -- Enables the snippet engine (required)
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    })

    -- I have to call this here and in snippetins.lua
    -- For some reason this stops html duplication inside
    -- jsx and tsx files.
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
