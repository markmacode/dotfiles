-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font stuff
local font = "JetBrainsMono Nerd Font"
local font_size = 16
config.font_size = font_size
config.font = wezterm.font({
  family = font,
  harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  weight = "Regular",
})
config.font_rules = {
  -- Bold and non-italic
  {
    intensity = "Bold",
    italic = false,
    font = wezterm.font({
      family = font,
      weight = "Bold",
    }),
  },

  -- Bold and italic
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font({
      family = font,
      weight = "Bold",
      style = "Italic",
    }),
  },
}
config.line_height = 1

config.keys = {
  {
    key = "j",
    mods = "CMD|ALT|CTRL",
    action = wezterm.action_callback(function(window, pane)
      -- window:toggle_fullscreen()
      local zoom_size = 20
      local current_overrides = window:get_config_overrides()
      if current_overrides ~= nil and current_overrides.font_size ~= font_size then
        window:set_config_overrides({ font_size = font_size })
        return
      end
      window:set_config_overrides({ font_size = zoom_size })
    end),
  },
}

-- Window stuff
config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = true
config.enable_scroll_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = '0.5cell',
  bottom = '0.5cell',
}
-- Snap to the size of cells
-- config.use_resize_increments = false

require("windows").apply(config)
return config
