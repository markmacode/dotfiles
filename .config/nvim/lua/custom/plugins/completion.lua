-- TODO: Separate completion and snippets
return {
  -- Autocompletion
  "hrsh7th/nvim-cmp",
  version = false,
  lazy = true,
  dependencies = {
    -- -- Snippet Engine & its associated nvim-cmp source
    { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
    "saadparwaiz1/cmp_luasnip",
    -- Adds LSP completion capabilities
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    -- Adds a number of user-friendly snippets
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
    local cmp = require("cmp")

    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.setup({
      -- The order of the sources will set the order of snippets
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
      }),

      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<Tab>"] = cmp.mapping(cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        })),
      }),

      -- Enables the snippet engine, this is required
      -- Look into the vim.snippet feature of Neovim 0.10
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    })
  end,
}
