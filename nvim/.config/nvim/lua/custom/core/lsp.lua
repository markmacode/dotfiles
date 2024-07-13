return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "b0o/schemastore.nvim",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
      },
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      require("custom.lsp")
    end,
  },
}
