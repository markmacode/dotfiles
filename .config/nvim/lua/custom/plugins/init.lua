return {
  -- Git
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- Good old gen-AI
  "github/copilot.vim",

  -- Used by many plugins
  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },

  -- Useful plugin to show you pending keybinds.
  {
    "folke/which-key.nvim",
    opts = {},
    config = function()
      require("which-key").register({
        ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
        ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
        ["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
        ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
        ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
        ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
      })
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  {
    -- Adds git related signs to the gutter.
    -- As well as utilities for managing changes.
    "lewis6991/gitsigns.nvim",
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
    },
  },

  {
    -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
        file_ignore_patterns = {
          "node_modules/",
          "venv/",
          "%.venv/",
          "%.git/",
        },
      },
    },
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/playground",
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag",
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        modules = {},
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "css",
          "godot_resource",
          "gdscript",
          "go",
          "javascript",
          "kdl",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "rust",
          "svelte",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
        ignore_install = {},
        sync_install = false,
        auto_install = true,
        autotag = { enable = true },
        endwise = { enable = true },
        indent = { enable = false },
        highlight = {
          enable = true,
          -- For better performance and making sure there is no conflicts
          -- with highlight grups that interact directly with treesitter.
          additional_vim_regex_highlighting = false,
        },
      })
    end,
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
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
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
