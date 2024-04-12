local wezterm = require 'wezterm'

return {
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