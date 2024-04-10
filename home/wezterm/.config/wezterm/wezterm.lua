-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.keys = require('keymap')
config.font = wezterm.font {
    family = 'JetBrainsMono Nerd Font',
    harfbuzz_features = { 'zero', 'cv06', 'cv07' }
}
config.font_size = 16

require('windows').apply(config)
require('colors').apply(config)
return config
