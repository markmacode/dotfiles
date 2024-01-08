-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    file_ignore_patterns = {
      "node_modules/",
      "%.git/",
    }
  },
  pickers = {
    git_files = {
      theme = "dropdown",
    },
    find_files = {
      theme = "dropdown",
      hidden = true,
    },
    grep_string = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
