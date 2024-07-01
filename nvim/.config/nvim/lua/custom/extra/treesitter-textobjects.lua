local util = require("custom.util")

return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.nvim",
  },
  branch = "main",
  config = function()
    local mini = require("mini.ai")
    mini.setup({ n_lines = 75 })

    require("nvim-treesitter-textobjects").setup({
      select = {
        lookahead = true,
      },
      move = {
        set_jumps = true,
      },
    })

    local tsselect = require("nvim-treesitter-textobjects.select")
    local select = function(object)
      tsselect.select_textobject(object, "textobjects")
    end

    local tsmove = require("nvim-treesitter-textobjects.move")
    local next_start = function(object)
      tsmove.goto_next_start(object, "textobjects")
    end
    local previous_start = function(object)
      tsmove.goto_previous_start(object, "textobjects")
    end
    local next_end = function(object)
      tsmove.goto_next_end(object, "textobjects")
    end
    local previous_end = function(object)
      tsmove.goto_previous_end(object, "textobjects")
    end

    -- Altering code
    -- stylua: ignore
    util.keys({
      { "af", function() select("@function.outer") end, desc = "Select function" },
      { "if", function() select("@function.inner") end, desc = "Select function inside" },
      { "ac", function() select("@call.outer") end, desc = "Select call" },
      { "ic", function() select("@call.inner") end, desc = "Select call args" },
      { "ad", function() select("@class.outer") end, desc = "Select class (typedef)" },
      { "id", function() select("@class.inner") end, desc = "Select class (typedef) inside" },
      { "al", function() select("@loop.outer") end, desc = "Select loop" },
      { "il", function() select("@loop.inner") end, desc = "Select loop inside" },
      { "aa", function() select("@conditional.outer") end, desc = "Select condition (assert)" },
      { "ia", function() select("@conditional.inner") end, desc = "Select condition (assert) inside" },
    }, { mode = { "x", "o" } })

    -- Moving around code
    -- stylua: ignore
    util.keys({
      { "]f", function() next_start("@function.outer") end, desc = "Goto next function start" },
      { "]c", function() next_start("@class.outer") end, desc = "Goto next class start" },
      { "[f", function() previous_start("@function.outer") end, desc = "Goto previous function start" },
      { "[c", function() previous_start("@class.outer") end, desc = "Goto previous class start" },
      { "]F", function() next_end("@function.outer") end, desc = "Goto next function end" },
      { "]C", function() next_end("@class.outer") end, desc = "Goto next class end" },
      { "[F", function() previous_end("@function.outer") end, desc = "Goto previous function end" },
      { "[C", function() previous_end("@class.outer") end, desc = "Goto previous class end" },
    }, { mode = { "n", "x", "o" } })

    local repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
    util.keys({
      { ";", repeat_move.repeat_last_move_next },
      { ",", repeat_move.repeat_last_move_previous },
    }, { mode = { "n", "x", "o" } })
  end,
}
