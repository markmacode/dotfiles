-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.keys = require('keymap')
config.font = wezterm.font {
    family = 'JetBrainsMono Nerd Font',
    harfbuzz_features = { 'zero', 'cv06', 'cv07' },
}
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '0.5cell',
  bottom = 0,
}
config.window_decorations = "RESIZE"
config.font_rules = {
    {
        intensity = 'Normal',
        italic = true,
        font = wezterm.font {
            family = 'Maple Mono',
            weight = 'Regular',
            italic = true,
        }
    }
}
config.font_size = 16

require('windows').apply(config)
require('colors').apply(config)
return config
