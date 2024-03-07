-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = 'nightfox'
config.keys = require('keymap')
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font_with_fallback {
    'Brosevka Nerd Font',
    'JetBrainsMono Nerd Font',
}
config.font_size = 16

require('windows').apply(config)
return config
