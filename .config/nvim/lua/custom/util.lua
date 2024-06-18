local M = {}

--- A more human readable and configurable mapping function
--- designed after the lazy.nvim way
---
--- @param maps table
function M.keys(maps, extra_opts)
  extra_opts = extra_opts or {}
  for _, value in ipairs(maps) do
    M.map(value, extra_opts)
  end
end

function M.map(table, extra_opts)
  local lhs = table[1]
  local rhs = table[2]
  local mode = table.mode or "n"
  local opts = {}

  for key, value in pairs(table) do
    if type(key) ~= "number" and key ~= "mode" then
      opts[key] = value
    end
  end

  for key, value in pairs(extra_opts) do
    if key == "mode" then
      mode = value
    else
      opts[key] = value
    end
  end

  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
