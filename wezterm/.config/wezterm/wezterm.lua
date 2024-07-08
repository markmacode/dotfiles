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
      local resolution = 1440
      local zoom_size = resolution / 45 -- this will be 32 on 1440p
      local current_overrides = window:get_config_overrides()
      if current_overrides ~= nil and current_overrides.font_size == zoom_size then
        window:toggle_fullscreen()
        window:set_config_overrides({ font_size = font_size })
        return
      end
      window:toggle_fullscreen()
      window:set_config_overrides({ font_size = zoom_size })
    end),
  },
}

-- Window stuff
config.color_scheme = "Tokyo Night"
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
-- Snap to the size of cells
-- config.use_resize_increments = true

require("windows").apply(config)
return config
