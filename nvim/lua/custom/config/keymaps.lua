-- Disable annoying stuff
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q:", "<nop>")

-- Just go down on wrapped lines
vim.keymap.set("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
vim.keymap.set("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })

-- Stay centered when jumping around
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Quickly paste what you actually yanked
vim.keymap.set({ "n", "x", "o" }, "gp", '"0p', { desc = "Paste last yank" })

-- Diagnostics
vim.keymap.set("n", "[q", vim.cmd.cprevious, { desc = "Quickfix prev" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Quickfix next" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next diagnostic message" })
vim.keymap.set("n", "H", vim.diagnostic.open_float, { desc = "Open diagnostic hover window" })
