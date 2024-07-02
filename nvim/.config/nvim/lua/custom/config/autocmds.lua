-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = require("custom.util").group,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Stop adding 'o' to the formatoptions.
-- This flag makes sure that the 'o' motion does not continue a comment
-- on a new line. A lot of default filetype settings will do this for
-- some reason.
vim.api.nvim_create_autocmd("FileType", {
  group = require("custom.util").group,
  callback = function()
    vim.opt.formatoptions:remove("o")
  end,
})
