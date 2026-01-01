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

    -- The ~/.ignore file will affect results of various file finders,
    -- so take that into consideration if results are not as expected.
    vim.keymap.set("n", "<leader>sp", picker.builtin, { desc = "Telescope pickers" })
    vim.keymap.set("n", "<leader>sr", picker.oldfiles, { desc = "Recent files" })
    vim.keymap.set("n", "<leader>sb", picker.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>sf", picker.find_files, { desc = "CWD files (general)" })
    vim.keymap.set("n", "<leader>sh", picker.help_tags, { desc = "Help" })
    vim.keymap.set("n", "<leader>sw", picker.grep_string, { desc = "Word (grep)" })
    vim.keymap.set("n", "<leader>sc", picker.live_grep, { desc = "Code (grep)" })
    vim.keymap.set("n", "<leader>/", picker.current_buffer_fuzzy_find, { desc = "Current buffer search" })

    vim.keymap.set("n", "<leader>sg", function()
      picker.git_files()
    end, { desc = "CWD files (git/general)" })

    vim.keymap.set("n", "<leader>sn", function()
      picker.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "Neovim config" })

    vim.keymap.set("n", "<leader>sl", function()
      picker.find_files({ cwd = vim.fn.stdpath("data") })
    end, { desc = "Neovim XDG data" })

    telescope.load_extension("fzf")
    telescope.setup({
      pickers = {
        git_files = {
          recurse_submodules = true,
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
        },
        file_ignore_patterns = {
          ".DS_Store",
          "\\.git/",
          "node_modules/",
          ".venv/",
          "venv/",
        },
      },
    })
  end,
}
