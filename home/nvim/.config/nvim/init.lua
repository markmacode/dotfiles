-- Must happen before plugins are required
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('mbromell.lazy')
require('mbromell.remap')
require('mbromell.lsp')
require('mbromell.options')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
