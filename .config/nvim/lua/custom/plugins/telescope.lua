return {
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
}
