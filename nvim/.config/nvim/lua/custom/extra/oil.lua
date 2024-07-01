return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>.", "<cmd>Oil<cr>", desc = "File tree" },
  },
  opts = {},
  init = function()
    local hide_exact = {
      ".",
      "..",
      ".git",
      ".DS_Store",
    }
    local hide_pattern = {}

    require("oil").setup({
      skip_confirm_for_simple_edits = true,
      use_default_keymaps = false,
      keymaps = {
        ["<leader>t?"] = { "actions.show_help", desc = "Help me" },
        ["<cr>"] = { "actions.select", desc = "Select dir/file" },
        ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open in vertical split" },
        ["<C-s>"] = { "actions.select", opts = { horizontal = true }, desc = "Open in horizontal split" },
        ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open in new tab" },
        ["<C-c>"] = { "actions.close", desc = "Close file tree" },
        ["<leader>tp"] = { "actions.preview", desc = "Open preview" },
        ["<leader>tr"] = { "actions.refresh", desc = "Refresh file tree" },
        ["<bs>"] = { "actions.parent", desc = "Go to parent dir" },
        ["<leader>t/"] = { "actions.open_cwd", desc = "Go to project root (cwd)" },
        ["<leader>t."] = { "actions.cd", opts = { scope = "tab" }, desc = "Set cwd to current dir" },
        ["<leader>to"] = { "actions.change_sort", desc = "Change sort order" },
        ["<leader>th"] = { "actions.toggle_hidden", desc = "Toggle hidden" },
        ["<leader>tb"] = { "actions.toggle_trash", desc = "Toggle bin (trash)" },
        ["<leader>ts"] = {
          function()
            require("telescope.builtin").find_files({
              cwd = require("oil").get_current_dir(),
            })
          end,
          mode = "n",
          nowait = true,
          desc = "Search in current directory",
        },
      },
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
}

