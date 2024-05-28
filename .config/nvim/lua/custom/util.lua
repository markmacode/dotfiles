local M = {}

--- @class (exact) custom.mapKey
--- @field [string] string description of keymap
--- @field [string|function] string|function keymap action
--- @field mode? string|table modes that keymap is valid (default "i")
--- @field opts? table regular vim keymap opts

--- A more human readable and configurable mapping function
--- to replace the use of |vim.keymap.set()|.
---
--- @param keymaps table
function M.map(keymaps)
  for key, map in pairs(keymaps) do
    if map.mode == nil then
      map.mode = "i"
    end

    if map.opts == nil then
      map.opts = {}
    end
    map.opts.desc = map[1]

    vim.keymap.set(map.mode, key, map[2], map.opts)
  end
end

return M
