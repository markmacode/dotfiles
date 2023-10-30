-- Must happen before plugins are required
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

require('mbromell.lazy')
require('mbromell.options')
require('mbromell.remap')
require('mbromell.lsp')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
