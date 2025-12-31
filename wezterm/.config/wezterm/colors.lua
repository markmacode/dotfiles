local wezterm = require("wezterm")
local module = {}

module.dark = "Catppuccin Mocha"
module.light = "Catppuccin Latte"

function module.scheme_name(appearance)
  if appearance:find("Dark") then
    return module.dark
  else
    return module.light
  end
end

function module.apply(config)
  -- Using dark theme by default
  config.color_scheme = module.dark

  -- Auto change light or dark mode depending on system config
  -- https://wezfurlong.org/wezterm/config/lua/window/get_appearance.html
  wezterm.on("window-config-reloaded", function(window, pane)
    local overrides = window:get_config_overrides() or {}
    local scheme_name = module.scheme_name(window:get_appearance())
    local scheme = wezterm.color.get_builtin_schemes()[scheme_name]

    overrides.colors = {
      tab_bar = {
        active_tab = {
          bg_color = scheme.brights[5],
          fg_color = scheme.background,
        },
        inactive_tab = {
          fg_color = scheme.foreground,
          bg_color = scheme.tab_bar.background,
        },
      },
    }
    window:set_config_overrides(overrides)

    if overrides.color_scheme ~= scheme_name then
      overrides.color_scheme = scheme_name
      window:set_config_overrides(overrides)
    end
  end)
end

return module
