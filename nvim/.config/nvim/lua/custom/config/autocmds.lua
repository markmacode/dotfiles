-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = require("custom.util").group,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Indent 4 spaces for these files
vim.api.nvim_create_autocmd("FileType", {
  group = require("custom.util").group,
  pattern = {
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "lua",
    "sh",
    "typescript",
    "typescriptreact",
    "xml",
    "yaml",
  },
  callback = function()
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Stop adding 'o' to the formatoptions.
-- This flag makes sure that the 'o' motion does not continue a comment
-- on a new line.
vim.api.nvim_create_autocmd("FileType", {
  group = require("custom.util").group,
  callback = function()
    vim.opt.formatoptions:remove("o")
  end,
})
