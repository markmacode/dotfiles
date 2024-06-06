local map = vim.keymap.set

map("i", "jk", "<Esc>")
map("n", "Q", "<nop>")
map("n", "q:", "<nop>")

-- half-page jumping but stay centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- search terms stay centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- put semicolon at end
map("n", "<leader>;", "A;<Esc>")

-- Toggle hlsearch if it's on, otherwise just do "enter"
map("n", "<CR>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.opt.hlsearch:get() then
    vim.cmd.nohl()
    return ""
  else
    return "<CR>"
  end
end, { expr = true })

-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
map({ "n", "v" }, "<Space>", "<Nop>", { noremap = true })

-- Remap for dealing with word wrap
map("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
map("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })

-- [[ Telescope ]]
-- See `:help telescope.builtin`
map(
  "n",
  "<leader>?",
  require("telescope.builtin").oldfiles,
  { desc = "[?] Find recently opened files" }
)
map(
  "n",
  "<leader><space>",
  require("telescope.builtin").buffers,
  { desc = "[ ] Find existing buffers" }
)

-- Smart navigation
map(
  "n",
  "<leader>gf",
  require("telescope.builtin").git_files,
  { desc = "search git files" }
)
map(
  { "n", "v" },
  "<leader>sf",
  require("telescope.builtin").find_files,
  { desc = "search files" }
)
map(
  "n",
  "<leader>sh",
  require("telescope.builtin").help_tags,
  { desc = "[S]earch [H]elp" }
)
map(
  "n",
  "<leader>sw",
  require("telescope.builtin").grep_string,
  { desc = "[S]earch current [W]ord" }
)
map(
  "n",
  "<leader>sg",
  require("telescope.builtin").live_grep,
  { desc = "[S]earch by [G]rep" }
)
map(
  "n",
  "<leader>sd",
  require("telescope.builtin").diagnostics,
  { desc = "[S]earch [D]iagnostics" }
)
map(
  "n",
  "<leader>sr",
  require("telescope.builtin").resume,
  { desc = "[S]earch [R]esume" }
)
map(
  "n",
  "<leader>/",
  require("telescope.builtin").current_buffer_fuzzy_find,
  { desc = "Fuzzy search current buffer" }
)

-- [[ Diagnostics ]]
map(
  "n",
  "[d",
  vim.diagnostic.goto_prev,
  { desc = "Go to previous diagnostic message" }
)
map(
  "n",
  "]d",
  vim.diagnostic.goto_next,
  { desc = "Go to next diagnostic message" }
)
map(
  "n",
  "<leader>i",
  vim.diagnostic.open_float,
  { desc = "Open floating diagnostic message" }
)
map(
  "n",
  "<leader>I",
  vim.diagnostic.setloclist,
  { desc = "Open diagnostics list" }
)

-- Lazygit
-- No need to manually use git-dir and git-worktree args for lazygit
-- because I set the equivalent env vars in autocommands now.
map("n", "<leader>l", function()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    hidden = true, -- Do not show in `:ToggleTerm` commands
  })
  lazygit:toggle()
end, { noremap = true, silent = true })
