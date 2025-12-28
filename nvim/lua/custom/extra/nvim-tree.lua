return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "File tree toggle" })

    require("nvim-tree").setup({
      view = {
        side = "right",
        width = 40,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          git_placement = "right_align",
          glyphs = {
            git = {
              untracked = "*",
            },
          },
        },
      },
    })
  end,
}
