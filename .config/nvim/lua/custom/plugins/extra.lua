return {
  {
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
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = true,
    opts = {},
    keys = function()
      local Terminal = require("toggleterm.terminal").Terminal
      return {
        {
          "<leader>gg",
          function()
            local lazygit = Terminal:new({
              cmd = "lazygit",
              direction = "float",
              hidden = true,
            })
            lazygit:toggle()
          end,
          desc = "Open lazygit",
          silent = true,
        },
      }
    end,
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*",
    ft = "markdown",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/me/notes",
        },
      },
      disable_frontmatter = true,
      templates = {
        folder = "zero/templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      require("which-key").register({
        ["<leader>a"] = { name = "+action/refactor" },
        ["<leader>l"] = { name = "+lsp" },
        ["<leader>f"] = { name = "+file/buffer" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>x"] = { name = "+quickfix/diagnostics" },
        ["["] = { name = "+prev" },
        ["]"] = { name = "+next" },
        ["z"] = { name = "+fold" },
      })
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
