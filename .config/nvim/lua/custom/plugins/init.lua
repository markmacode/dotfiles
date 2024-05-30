return {
  -- Good old gen-AI
  "github/copilot.vim",

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = function()
      local f = require("flash")
      return {
        { "s", mode = { "n", "x", "o" }, f.jump, desc = "Flash" },
        {
          "S",
          mode = { "n", "x", "o" },
          f.treesitter,
          desc = "Flash Treesitter",
        },
        { "<c-s>", mode = { "c" }, f.toggle, desc = "Toggle Flash Search" },
      }
    end,
  },

  -- Useful plugin to show you pending keybinds.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
    end,
    opts = {},
  },

  {
    -- Set lualine as statusline
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        component_separators = "|",
        section_separators = "",
      },
      sections = {
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
      },
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/me/notes",
        },
        {
          name = "game",
          path = "~/me/repos/pooch-projectile/Docs",
        },
      },
      disable_frontmatter = true,
      templates = {
        folder = "Meta/Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },
    },
  },

  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = "81",
    },
  },

  -- Godot file syntax highlighting is lacking without this
  {
    "habamax/vim-godot",
    event = "VimEnter",
  },
}
