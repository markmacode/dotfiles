return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = true,
  main = "ibl",
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    -- scope = { show_start = false, show_end = false },
    exclude = {
      filetypes = {
        "help",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
      },
    },
  },
}
