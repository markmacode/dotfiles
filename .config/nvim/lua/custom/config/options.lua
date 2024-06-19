local o = vim.opt

-- General
o.undofile = true -- Enable persistent undo (see also `:h undodir`)
o.backup = false -- Don't store backup while overwriting the file
o.writebackup = false -- Don't store backup while overwriting the file
o.mouse = "a" -- Enable mouse for all available modes
vim.cmd("filetype plugin indent on") -- Enable all filetype plugins

-- Appearance
o.breakindent = true -- Indent wrapped lines to match line start
o.cursorline = true -- Highlight current line
o.linebreak = true -- Wrap long lines at 'breakat' (if 'wrap' is set)
o.number = true -- Show line numbers
o.scrolloff = 8 -- Keep 8 lines padding the cursor when scrolling files
o.showbreak = "󱞩 " -- Show a nice symbol on a soft-wrapped line
o.splitbelow = true -- Horizontal splits will be below
o.splitright = true -- Vertical splits will be to the right
o.relativenumber = true -- Line numbers are relative to current line
o.ruler = false -- Don't show cursor position in command line
o.showmode = false -- Don't show mode in command line
o.wrap = false -- Display long lines as just one line
o.signcolumn = "yes" -- Always show sign column (otherwise it will shift text)

-- Editing
o.ignorecase = true -- Ignore case when searching (use `\C` to force not doing that)
o.inccommand = "split" -- Show some commands in an updating window
o.incsearch = true -- Show search results while typing
o.infercase = true -- Infer letter cases for a richer built-in keyword completion
o.smartcase = true -- Don't ignore case when searching if pattern has upper case
o.smartindent = true -- Make indenting smart
o.completeopt = "menuone,noinsert,noselect" -- Customize completions
o.virtualedit = "block" -- Allow going past the end of line in visual block mode
o.formatoptions = "qjl1" -- Don't autoformat comments
