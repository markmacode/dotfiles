-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = 'nightfox'
config.keys = require('keymap')
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font {
    family = 'JetBrains Mono',
    harfbuzz_features = { 'ss02', 'ss19', 'cv18' }
}
config.font_size = 14

require('windows').apply(config)
return config
