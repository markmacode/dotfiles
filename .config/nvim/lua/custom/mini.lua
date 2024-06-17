require("mini.diff").setup({ view = { style = "sign" } })
require("mini.hipatterns").setup()
require("mini.indentscope").setup({ symbol = "│" })
require("mini.statusline").setup()
require("mini.hipatterns").setup()
require("mini.move").setup()
-- require("mini.surround").setup()
require("mini.trailspace").setup()

local ai = require("mini.ai")
ai.setup({
  n_lines = 75,
  custom_textobjects = {
    F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
    c = ai.gen_spec.treesitter({ a = "@conditional.outer", i = "@conditional.inner" }),
    l = ai.gen_spec.treesitter({ a = "@loop.outer", i = "@loop.inner" }),
  },
})
