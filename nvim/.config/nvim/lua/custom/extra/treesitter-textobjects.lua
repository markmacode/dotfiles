-- Another plugin to stop the need for doing a bunch of motions when
-- altering text. For many patterns you can now use a single motion for
-- yanking, deleting or changing blocks of code.
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.nvim",
  },
  event = "VeryLazy",
  branch = "main",
  config = function()
    local spec_treesitter = require("mini.ai").gen_spec.treesitter
    require("mini.ai").setup({
      n_lines = 75,
      custom_textobjects = {
        f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
        d = spec_treesitter({ a = "@class.outer", i = "@class.inner" }),
        o = spec_treesitter({
          a = { "@conditional.outer", "@loop.outer" },
          i = { "@conditional.inner", "@loop.inner" },
        }),
      },
    })

    require("nvim-treesitter-textobjects").setup({
      select = {
        lookahead = true,
      },
    })

    -- Altering code
    -- I prefer to use mini.ai to set these up, but for some reason it
    -- does not want to work for the @call object, which I use a lot.
    local select = require("nvim-treesitter-textobjects.select").select_textobject
    -- stylua: ignore
    require("custom.util").keys({
      { "ac", function() select("@call.outer") end, desc = "Select call" },
      { "ic", function() select("@call.inner") end, desc = "Select call args" },
    }, { mode = { "x", "o" } })

    -- Swapping stuff
    local swap = require("nvim-treesitter-textobjects.swap")
    require("custom.util").keys({
      { "<leader>rl", swap.swap_next("@parameter.inner"), desc = "Swap parameter right" },
      { "<leader>rh", swap.swap_previous("@parameter.inner"), desc = "Swap parameter left" },
      { "<leader>rL", swap.swap_next("@function.outer"), desc = "Swap function right" },
      { "<leader>rH", swap.swap_previous("@function.outer"), desc = "Swap function left" },
    })
  end,
}
