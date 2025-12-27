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
        enable = true,
        lookahead = true,
        keymaps = {
          ["ic"] = { query = "@call.inner", desc = "Select operation call parameters" },
          ["ac"] = { query = "@call.outer", desc = "Select operation call" },
        },
      },
      textobjects = {
        swap = {
          enable = true,
          swap_next = {
            ["<leader>rl"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
            ["<leader>rL"] = { query = "@function.outer", desc = "Swap with next function" },
          },
          swap_previous = {
            ["<leader>rh"] = { query = "@parameter.inner", desc = "Swap with previous parameter" },
            ["<leader>rH"] = { query = "@function.outer", desc = "Swap with previous function" },
          },
        },
      },
    })
  end,
}
