-- [[ Setting options ]]
-- See `:help vim.opt`

vim.api.nvim_set_hl(0, "@parameter", { italic = true })

-- Any opts commented out are done by mini.nvim

-- The basics
-- vim.opt.mouse = "a" -- You can use a mouse if needed :)
-- vim.opt.termguicolors = true -- Use more colors
vim.opt.updatetime = 1000 -- Make updates happen faster

-- Line number column
vim.opt.relativenumber = true -- Show line numbers
-- vim.opt.number = true -- But show the actual number for the line we're on
-- vim.opt.signcolumn = "yes" -- Allows git signs and diagnostics

-- Buffer management
vim.opt.autoread = true -- Safely load external buffer changes
vim.opt.autowrite = true -- Write buffer changes on various events
vim.opt.clipboard = "unnamedplus" -- Use the "+ register
-- vim.opt.undofile = true -- Persist change history in a file
vim.opt.swapfile = false -- Dont litter my projects with swap files
-- vim.opt.completeopt = "menuone,noselect" -- I dont know what you do..
vim.opt.hidden = true -- I like having buffers stay around

-- Line wrapping
vim.opt.colorcolumn = "80" -- Visual lines suggesting length limit
-- vim.opt.wrap = true -- Soft wrap lines that go beyond viewable width
-- vim.opt.breakindent = true -- Indent wrapped lines
-- vim.opt.linebreak = true -- Dont wrap lines in the middle of a word
vim.opt.showbreak = "󱞩 " -- 󱞩 󰘍 󱞵

-- Tabs and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.opt.smartindent = true
vim.opt.autoindent = true

-- Searching
vim.opt.hlsearch = false -- Dont highlight the matches of searched words
-- vim.opt.incsearch = true -- Makes search act like search in modern browsers
vim.opt.showmatch = true -- Show matching brackets
-- vim.opt.ignorecase = true -- Ignore case when searching...
-- vim.opt.smartcase = true -- ... unless there is a capital letter in the query

-- Window Management
vim.opt.equalalways = false -- I don't like my windows changing all the time
-- vim.opt.splitright = true -- Prefer windows splitting to the right
-- vim.opt.splitbelow = true -- Prefer windows splitting to the bottom
vim.opt.scrolloff = 8 -- keep 8 lines padding the cursor when scrolling files
vim.opt.inccommand = "split" -- show some commands in an updating window

-- Format options innit
vim.opt.formatoptions = vim.opt.formatoptions
  - "a" -- Auto formatting is BAD
  - "t" -- Don't auto format my code. I got linters for that
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter
  + "n" -- Indent past the formatlistpat, not underneath it
  + "j" -- Auto-remove comments if possible
  - "2" -- No indenting of continuation paragraphs
