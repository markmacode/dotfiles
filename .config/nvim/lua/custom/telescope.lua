local telescope = require("telescope")

telescope.load_extension("fzf")
telescope.setup({
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
    },
  },
})
