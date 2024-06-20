return {
  {
    "nvim-telescope/telescope.nvim",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = function()
      local tb = require("telescope.builtin")
      return {
        { "<leader>ss", tb.resume, desc = "Resume" },
        { "<leader>sp", tb.builtin, desc = "Telescope pickers" },
        { "<leader>sr", tb.oldfiles, desc = "Recent files" },
        { "<leader>sb", tb.buffers, desc = "Buffers" },
        -- TODO: Change this once you go back to using GNU/stow
        {
          "<leader>sf",
          function()
            if vim.env.GIT_WORK_TREE == vim.fn.expand("~") then
              tb.git_files({ show_untracked = false })
            else
              tb.git_files()
            end
          end,
          desc = "Git files",
        },
        { "<leader>sd", tb.find_files, desc = "CWD files" },
        { "<leader>sh", tb.help_tags, desc = "Help" },
        { "<leader>sw", tb.grep_string, desc = "Word (grep)" },
        { "<leader>sc", tb.live_grep, desc = "Code (grep)" },
        { "<leader>/", tb.current_buffer_fuzzy_find, desc = "Current buffer search" },
        {
          "<leader>sn",
          function()
            tb.find_files({ cwd = vim.fn.stdpath("config") })
          end,
          desc = "Neovim config",
        },
      }
    end,
    config = function()
      local telescope = require("telescope")
      telescope.load_extension("fzf")
      telescope.setup({
        pickers = {
          git_files = {
            show_untracked = true,
          },
        },
        defaults = {
          sorting_strategy = "ascending",
          layout_strategy = "flex",
          layout_config = {
            prompt_position = "top",
            -- For some reason builtin flex is not smart enough
            flip_columns = 120,
            flip_lines = 40,
          },
          file_ignore_patterns = {
            ".DS_Store",
            ".git/",
          },
        },
      })
    end,
  },

  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>t", "<cmd>Oil<cr>", desc = "File tree" },
    },
    opts = {},
    init = function()
      local hide_exact = {
        ".",
        "..",
        ".git",
        ".DS_Store",
        ".Trash",
        ".vscode",
        ".idea",
      }
      local hide_pattern = {}

      require("oil").setup({
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          ---@diagnostic disable-next-line: unused-local
          is_always_hidden = function(name, bufnr)
            for _, value in ipairs(hide_exact) do
              if name == value then
                return true
              end
            end

            for _, pattern in ipairs(hide_pattern) do
              if name:match(pattern) then
                return true
              end
            end

            return false
          end,
        },
      })
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("harpoon").setup({})
    end,
    keys = function()
      local h = require("harpoon")
    -- stylua: ignore
    return {
      { "<leader>1", function() h:list():select(1) end, desc = "Harpoon 1" },
      { "<leader>2", function() h:list():select(2) end, desc = "Harpoon 2" },
      { "<leader>3", function() h:list():select(3) end, desc = "Harpoon 3" },
      { "<leader>4", function() h:list():select(4) end, desc = "Harpoon 4" },
      { "<leader>fl", function() h.ui:toggle_quick_menu(h:list()) end, desc = "Bookmark list" },
      { "<leader>fi", function() h:list():add() end, desc = "Bookmark insert" },
    }
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>xl",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
      {
        "<leader>xc",
        "<cmd>Trouble todo toggle<cr>",
        desc = "Todo comments toggle (Trouble)",
      },
    },
    opts = {},
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
