require("mini.basics").setup()
require("mini.diff").setup({ view = { style = "sign" } })
require("mini.hipatterns").setup()
require("mini.indentscope").setup({ symbol = "│" })
require("mini.hipatterns").setup()
require("mini.move").setup()
require("mini.pairs").setup()
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

local clue = require("mini.clue")
clue.setup({
  triggers = {
    -- Leader triggers
    { mode = "n", keys = "<Leader>" },
    { mode = "x", keys = "<Leader>" },

    -- Built-in completion
    { mode = "i", keys = "<C-x>" },

    -- `g` key
    { mode = "n", keys = "g" },
    { mode = "x", keys = "g" },

    -- Marks
    { mode = "n", keys = "'" },
    { mode = "n", keys = "`" },
    { mode = "x", keys = "'" },
    { mode = "x", keys = "`" },

    -- Registers
    { mode = "n", keys = '"' },
    { mode = "x", keys = '"' },
    { mode = "i", keys = "<C-r>" },
    { mode = "c", keys = "<C-r>" },

    -- Window commands
    { mode = "n", keys = "<C-w>" },

    -- `z` key
    { mode = "n", keys = "z" },
    { mode = "x", keys = "z" },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    clue.gen_clues.builtin_completion(),
    clue.gen_clues.g(),
    clue.gen_clues.marks(),
    clue.gen_clues.registers(),
    clue.gen_clues.windows(),
    clue.gen_clues.z(),
  },
})
