return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup()
      require("mini.basics").setup()
      require("mini.diff").setup({ view = { style = "sign" } })
      require("mini.hipatterns").setup()
      require("mini.indentscope").setup({ symbol = "│" })
      require("mini.hipatterns").setup()
      require("mini.pairs").setup()
      -- require("mini.surround").setup()
      require("mini.trailspace").setup()
    end,
  },
}
