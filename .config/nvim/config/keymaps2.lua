-- This is a table that defines a collection of keymaps for neovim.
--
-- The reason to have singel table for this is so that keymaps are
-- shown in a more unified way, if you want to add, change, or view
-- what maps are set, you just go here.
--
-- A quality of life upgrade that I personally think is better, is
-- putting the `lhs` and `rhs` part of the map FIRST. When I look for
-- a ganeral `keymap.set` I almost never care to look for the `mode`
-- first, so you have something like `vim.keymap.set('n', ...)`. This
-- is so much empty useless infomation just blurring what my keymaps
-- actually are. The actual mapped `lhs` should be what is first on
-- the arg list or at the top of the table, each keymap for this table
-- has the following layout:
--
--   {
--     lhs: string,
--     rhs: string|function,
--     mode: string|table,
--     description: string,
--     opts: table|nil,
--   }
local keymap = {
  {
    "<Space>",
    "<Nop>",
    "",
    { "n", "v" },
    { silent = true },
  },
  {
    "<leader>s",
    "*search",
    {
      {
        "r",
        require("telescope.builtin").git_files,
        "git *repo",
        "n",
      },
      {
        "f",
        require("telescope.builtin").find_files,
        "*files",
        "n",
      },
      {
        "h",
        require("telescope.builtin").help_tags,
        "*help",
        "n",
      },
      {
        "w",
        require("telescope.builtin").grep_string,
        "current *word",
        "n",
      },
      {
        "g",
        require("telescope.builtin").live_grep,
        "by *grep",
        "n",
      },
      {
        "d",
        require("telescope.builtin").diagnostics,
        "*diagnostics",
        "n",
      },
      {
        "a",
        require("telescope.builtin").resume,
        "*again",
        "n",
      },
    },
  },
}
