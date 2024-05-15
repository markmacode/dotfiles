-- [[ Setting options ]]
-- See `:help vim.opt`

vim.api.nvim_set_hl(0, "@parameter", { italic = true })

-- Any opts commented out are done by mini.nvim

-- The basics
vim.opt.updatetime = 1000 -- Make updates happen faster

-- Line number column
vim.opt.relativenumber = true -- Show line numbers relative to current
vim.opt.signcolumn = "yes" -- Allows git signs and diagnostics

-- Buffer management
vim.opt.autoread = true -- Safely load external buffer changes
vim.opt.autowrite = true -- Write buffer changes on various events
vim.opt.clipboard = "unnamedplus" -- Use the "+ register
vim.opt.swapfile = false -- Dont litter my projects with swap files
vim.opt.hidden = true -- I like having buffers stay around

-- Line wrapping
vim.opt.colorcolumn = "80" -- Visual lines suggesting length limit
vim.opt.showbreak = "󱞩 " -- 󱞩 󰘍 󱞵

-- Tabs and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Searching
vim.opt.hlsearch = false -- Dont highlight the matches of searched words
vim.opt.showmatch = true -- Show matching brackets

-- Window Management
vim.opt.equalalways = false -- I don't like my windows changing all the time
vim.opt.scrolloff = 8 -- keep 8 lines padding the cursor when scrolling files
vim.opt.inccommand = "split" -- show some commands in an updating window

-- Format options innit
vim.opt.formatoptions = vim.opt.formatoptions
  - "o" -- O and o, don't continue comments
  - "2" -- No indenting of continuation paragraphs
  - "a" -- Auto formatting is BAD
  - "t" -- Don't auto format my code. I got linters for that
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  + "r" -- But do continue when pressing enter
  + "n" -- Indent past the formatlistpat, not underneath it
  + "j" -- Auto-remove comments if possible
