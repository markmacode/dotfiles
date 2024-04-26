-- [[ Setting options ]]
-- See `:help vim.o`
vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.wrap = true
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.showbreak = '󱞩 ' -- 󱞩 󰘍 󱞵
vim.o.guicursor =
    'n-v-c-sm:block,' ..
    'i-ci-ve:ver25,' ..
    'r-cr-o:hor20'

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.autoread = true
vim.o.updatetime = 150
vim.o.timeoutlen = 300
vim.o.clipboard = 'unnamedplus'
vim.o.undofile = true
vim.o.swapfile = false
vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true
vim.wo.signcolumn = 'yes'
vim.o.colorcolumn = '80'
vim.o.scrolloff = 8

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

