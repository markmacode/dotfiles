local M = {}

--- A more human readable and configurable mapping function
--- to replace the use of |vim.keymap.set()|.
---
--- @param keymaps table
function M.map(keymaps)
  for key, map in pairs(keymaps) do
    if map.mode == nil then
      map.mode = "n"
    end
    local opts = {}
    opts.desc = map.desc
    opts.silent = map.silent

    vim.keymap.set(map.mode, key, map[1], opts)
  end
end

return M
