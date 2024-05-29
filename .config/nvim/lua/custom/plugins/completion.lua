return {
  -- Autocompletion
  "hrsh7th/nvim-cmp",
  version = false,
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
    "saadparwaiz1/cmp_luasnip",

    -- Adds LSP completion capabilities
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",

    -- Adds a number of user-friendly snippets
    "rafamadriz/friendly-snippets",
  },
  opts = function()
    require("custom.completion")
  end,
}
