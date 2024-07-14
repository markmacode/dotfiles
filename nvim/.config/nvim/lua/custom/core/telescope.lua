return {
  "nvim-telescope/telescope.nvim",
  version = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = function()
    local picker = require("telescope.builtin")
    local telescope = require("telescope")

    require("custom.util").keys({
      { "<leader>ss", picker.resume, desc = "Resume" },
      { "<leader>sp", picker.builtin, desc = "Telescope pickers" },
      { "<leader>sr", picker.oldfiles, desc = "Recent files" },
      { "<leader>sb", picker.buffers, desc = "Buffers" },
      { "<leader>sa", picker.find_files, desc = "CWD files (general)" },
      { "<leader>sh", picker.help_tags, desc = "Help" },
      { "<leader>sw", picker.grep_string, desc = "Word (grep)" },
      { "<leader>sc", picker.live_grep, desc = "Code (grep)" },
      { "<leader>/", picker.current_buffer_fuzzy_find, desc = "Current buffer search" },
      {
        "<leader>sf",
        function()
          vim.fn.system("git rev-parse --is-inside-work-tree")
          if vim.v.shell_error == 0 then
            picker.git_files()
          else
            picker.find_files()
          end
        end,
        desc = "CWD files (git/general)",
      },
      {
        "<leader>sn",
        function()
          picker.find_files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Neovim config",
      },
    })

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
          "node_modules/",
        },
      },
    })
  end,
}
