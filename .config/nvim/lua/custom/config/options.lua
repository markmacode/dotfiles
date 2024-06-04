vim.api.nvim_set_hl(0, "@parameter", { italic = true })

-- Sign columns
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "auto:3" -- Allows git signs and diagnostics

-- Tabs and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Use the "+ register
vim.opt.clipboard = "unnamedplus"

-- Show line wrap continuation prettiness
vim.opt.showbreak = "󱞩 " -- 󱞩 󰘍

-- Keep 8 lines padding the cursor when scrolling files
vim.opt.scrolloff = 8

-- Show some commands in an updating window
vim.opt.inccommand = "split"
