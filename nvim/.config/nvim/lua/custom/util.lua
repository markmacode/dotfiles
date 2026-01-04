local M = {}

--- Get my autocommand group from one spot only, easy to change later.
M.group = vim.api.nvim_create_augroup("markmacode", { clear = true })

return M
