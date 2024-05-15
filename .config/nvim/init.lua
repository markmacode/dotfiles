-- Must happen before plugins are required
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("config.options")

-- Install package manager
-- `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("custom.plugins", {
  change_detection = {
    enabled = true,
    notify = false,
  },
})

require("config.filetype")
require("config.keymaps")
require("config.autocmds")
