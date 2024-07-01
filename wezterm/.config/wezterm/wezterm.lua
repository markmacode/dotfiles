-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.leader = { key = "e", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = require("keymap")

-- Font stuff
local font = "JetBrainsMono Nerd Font"
config.font_size = 16
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

-- Window stuff
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
require("colors").apply(config)
return config
