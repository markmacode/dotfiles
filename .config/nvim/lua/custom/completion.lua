vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item({
      behavior = cmp.SelectBehavior.Insert,
    }),
    ["<C-p>"] = cmp.mapping.select_prev_item({
      behavior = cmp.SelectBehavior.Insert,
    }),
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

require("custom.util").keys({
  {
    "<C-k>",
    function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end,
    mode = { "i", "s" },
    desc = "snippet: cursor jump next",
    silent = true,
  },
  {
    "<C-j>",
    function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end,
    mode = { "i", "s" },
    desc = "snippet: cursor jump previous",
    silent = true,
  },
})
