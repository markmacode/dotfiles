-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.keys = require('keymap')

-- Font stuff
config.font_size = 16
config.font = wezterm.font {
    family = 'Brosevka Nerd Font',
    weight = 400,
}

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

require('windows').apply(config)
require('colors').apply(config)
return config
