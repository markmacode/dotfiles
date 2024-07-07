return {
  "hrsh7th/nvim-cmp",
  version = false,
  dependencies = {
    -- Snippet engine
    "L3MON4D3/LuaSnip",
    -- Extra sources to make life easy
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  opts = function()
    require("custom.completion")
  end,
}
