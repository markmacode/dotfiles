return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
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
