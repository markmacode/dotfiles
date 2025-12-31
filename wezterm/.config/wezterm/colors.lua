local wezterm = require("wezterm")
local module = {}

local function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

-- Auto change light or dark mode depending on system config
-- https://wezfurlong.org/wezterm/config/lua/window/get_appearance.html
wezterm.on("window-config-reloaded", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)

  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
end)

return {}
