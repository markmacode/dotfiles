local wezterm = require("wezterm")
local module = {}
local act = wezterm.action

function module.apply(config)
  config.keys = {
    -- Presentation mode with zoomed in text
    {
      key = "j",
      mods = "CMD|ALT|CTRL",
      action = wezterm.action_callback(function(window, pane)
        -- window:toggle_fullscreen()
        local zoom_size = 20
        local current_overrides = window:get_config_overrides()
        if current_overrides ~= nil and current_overrides.font_size ~= config.font_size then
          window:set_config_overrides({ font_size = config.font_size })
          return
        end
        window:set_config_overrides({ font_size = zoom_size })
      end),
    },

    -- Opt-Left and Opt-Right will jump words on MacOS
    {
      key = "LeftArrow",
      mods = "OPT",
      action = act.SendKey({ key = "b", mods = "ALT" }),
    },
    {
      key = "RightArrow",
      mods = "OPT",
      action = act.SendKey({ key = "f", mods = "ALT" }),
    },

    -- Navigation on panes
    {
      key = "h",
      mods = "CTRL",
      action = act.ActivatePaneDirection("Left"),
    },
    {
      key = "j",
      mods = "CTRL",
      action = act.ActivatePaneDirection("Down"),
    },
    {
      key = "k",
      mods = "CTRL",
      action = act.ActivatePaneDirection("Up"),
    },
    {
      key = "l",
      mods = "CTRL",
      action = act.ActivatePaneDirection("Right"),
    },
  }
end

return module
