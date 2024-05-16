local function augroup(name)
  return vim.api.nvim_create_augroup("mbromell_" .. name, { clear = true })
end

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})
