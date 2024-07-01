vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.smartindent = true -- Be smart about how to indent
vim.opt.scrolloff = 8 -- Tap & bottom padding on the cursor when scrolling files
vim.opt.showbreak = "󱞩 " -- Show a nice symbol on a soft-wrapped line
vim.opt.relativenumber = true -- Line numbers are relative to current line
vim.opt.inccommand = "split" -- Show some commands in an updating window
vim.opt.listchars = "tab:> ,extends:…,precedes:…,nbsp:␣" -- Define which helper symbols to show
vim.opt.list = true -- Show some helper symbols
vim.opt.formatoptions:remove({'o'}) -- Do not continue comments on `o`

vim.cmd.packadd("cfilter")
