return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.basics").setup()
    require("mini.diff").setup({ view = { style = "sign" } })
    require("mini.statusline").setup()
    require("mini.hipatterns").setup()
    require("mini.trailspace").setup()
    require("mini.indentscope").setup({ symbol = "│" })
    require("mini.move").setup()
  end,
}
