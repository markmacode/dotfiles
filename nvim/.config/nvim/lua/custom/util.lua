local M = {}

--- Get my autocommand group from one spot only, easy to change later.
M.group = vim.api.nvim_create_augroup("markmacode", { clear = true })

--- A more human readable and configurable mapping function
--- designed after the lazy.nvim way. Each map entry defaults
--- to normal mode.
---
--- @param maps table  map entries in the format of lazy.vim `keys`
--- @param extra_opts table|nil  keymap opts to apply on every map in `maps`
function M.keys(maps, extra_opts)
  extra_opts = extra_opts or {}
  for _, value in ipairs(maps) do
    M._map(value, extra_opts)
  end
end

function M._map(table, extra_opts)
  local lhs = table[1]
  local rhs = table[2]
  local mode = table.mode or "n"
  local opts = {}

  -- only send actual keymap opts to `opts`
  for key, value in pairs(table) do
    if type(key) ~= "number" and key ~= "mode" then
      opts[key] = value
    end
  end

  -- apply the extra opts too, overriding if needed
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
