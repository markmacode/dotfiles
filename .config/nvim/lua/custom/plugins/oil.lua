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

return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>t", "<cmd>Oil<cr>", "Open file tree" },
  },
  opts = {},
  init = function()
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
}
