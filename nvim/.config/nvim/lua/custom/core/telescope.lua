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
      { "<leader>sa", tb.find_files, desc = "CWD files (general)" },
      { "<leader>sh", tb.help_tags, desc = "Help" },
      { "<leader>sw", tb.grep_string, desc = "Word (grep)" },
      { "<leader>sc", tb.live_grep, desc = "Code (grep)" },
      { "<leader>/", tb.current_buffer_fuzzy_find, desc = "Current buffer search" },
      {
        "<leader>sf",
        function()
          vim.fn.system("git rev-parse --is-inside-work-tree")
          if vim.v.shell_error == 0 then
            tb.git_files()
          else
            tb.find_files()
          end
        end,
        desc = "CWD files (git/general)",
      },
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
        -- Refer `~/.ignore` if there is a directory that still isn't showing
        -- up insdie "find_files" or "live_grep"
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = { "--hidden" },
        },
        grep_string = {
          additional_args = { "--hidden" },
        }
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
          "node_modules/"
        },
      },
    })
  end,
}
