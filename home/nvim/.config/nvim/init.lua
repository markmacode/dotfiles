-- Must happen before plugins are required
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
-- `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

require("mbromell.remap")
require("mbromell.lsp")
require("mbromell.options")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
