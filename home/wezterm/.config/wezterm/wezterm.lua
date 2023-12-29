-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.color_scheme = 'nightfox'
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font {
    family = 'JetBrains Mono',
    harfbuzz_features = { 'ss02', 'ss19', 'cv18' }
}
config.font_size = 14

-- Key overrides
config.keys = {
    {
        key = 'LeftArrow',
        mods = 'ALT|SHIFT',
        action = wezterm.action.SendKey { key = '!', mods = 'ALT' },
    },
    {
        key = 'DownArrow',
        mods = 'ALT|SHIFT',
        action = wezterm.action.SendKey { key = '@', mods = 'ALT' },
    },
    {
        key = 'UpArrow',
        mods = 'ALT|SHIFT',
        action = wezterm.action.SendKey { key = '#', mods = 'ALT' },
    },
    {
        key = 'RightArrow',
        mods = 'ALT|SHIFT',
        action = wezterm.action.SendKey { key = '$', mods = 'ALT' },
    },
    {
        key = 'LeftArrow',
        mods = 'ALT|SUPER',
        action = wezterm.action.SendKey { key = '%', mods = 'ALT' },
    },
    {
        key = 'DownArrow',
        mods = 'ALT|SUPER',
        action = wezterm.action.SendKey { key = '^', mods = 'ALT' },
    },
    {
        key = 'UpArrow',
        mods = 'ALT|SUPER',
        action = wezterm.action.SendKey { key = '&', mods = 'ALT' },
    },
    {
        key = 'RightArrow',
        mods = 'ALT|SUPER',
        action = wezterm.action.SendKey { key = '*', mods = 'ALT' },
    },
    {
        key = ']',
        mods = 'ALT|SHIFT',
        action = wezterm.action.SendKey { key = '[', mods = 'ALT' },
    },
}

return config
