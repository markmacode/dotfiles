local map = vim.keymap.set

map("i", "jk", "<Esc>")
map("n", "Q", "<nop>")
map("n", "q:", "<nop>")
map({ "n", "v" }, "<Space>", "<Nop>", { noremap = true })

-- half-page jumping but stay centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- search terms stay centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- sort lines
map("v", "gs", "<cmd>'<,'>sort<cr>", { desc = "Sort selection" })

-- Toggle hlsearch if it's on, otherwise just do "enter"
map("n", "<CR>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.opt.hlsearch:get() then
    vim.cmd.nohl()
    return ""
  end
  return "<CR>"
end, { expr = true })

-- Remap for dealing with word wrap
map("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
map("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })

-- [[ Diagnostics ]]
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map("n", "<leader>i", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>I", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

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

-- Quickfix
map("n", "[x", "<cmd>cprev<cr>", { desc = "Quickfix prev" })
map("n", "]x", "<cmd>cnext<cr>", { desc = "Quickfix next" })
map("n", "<leader>xf", "<cmd>cfirst<cr>", { desc = "Quickfix first" })
