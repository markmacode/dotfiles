local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Text
local font = "JetBrainsMono Nerd Font"
local font_size = 14
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

-- Window stuff
config.window_padding = {
  left = 0,
  right = 0,
  top = "0.5cell",
  bottom = "0.5cell",
}
config.enable_tab_bar = true
config.enable_scroll_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false

require("status").apply(config)
require("keymap").apply(config)
require("colors").apply(config)
require("windows").apply(config)

return config
