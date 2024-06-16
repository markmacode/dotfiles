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
      { "<leader>sf", tb.git_files, desc = "Git files" },
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
        desc = "NeoVim config",
      },
    }
  end,
  config = function()
    require("custom.telescope")
  end,
}
