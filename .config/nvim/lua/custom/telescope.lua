local telescope = require("telescope")

telescope.load_extension("fzf")
telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
    layout_strategy = "flex",
    layout_config = {
      prompt_position = "top",
      -- For some reason flex is not smart enough
      flip_columns = 120,
      flip_lines = 40,
      -- horizontal = {
      --   preview_width = 81,
      -- },
    },
    file_ignore_patterns = {
      "node_modules/",
      "venv/",
      "%.venv/",
      "%.git/",
    },
  },
})
