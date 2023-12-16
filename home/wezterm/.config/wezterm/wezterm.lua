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
config.font = wezterm.font_with_fallback {
    { family = 'Cascadia Code PL' },
    { family = 'JetBrains Mono',  harfbuzz_features = { 'ss02', 'ss19' } },
}
config.font_size = 14
config.line_height = 1.1

config.keys = {
    -- Focus
    {
        mods = 'ALT',
        key = 'F13',
        action = wezterm.action.SendKey { mods = 'ALT', key = 'LeftArrow' },
    },
    {
        mods = 'ALT',
        key = 'F14',
        action = wezterm.action.SendKey { mods = 'ALT', key = 'DownArrow' },
    },
    {
        mods = 'ALT',
        key = 'F15',
        action = wezterm.action.SendKey { mods = 'ALT', key = 'UpArrow' },
    },
    {
        mods = 'ALT',
        key = 'F16',
        action = wezterm.action.SendKey { mods = 'ALT', key = 'RightArrow' },
    },
    -- Move
    {
        mods = 'SHIFT|ALT',
        key = 'F13',
        action = wezterm.action.SendKey { key = 'F1' },
    },
    {
        mods = 'SHIFT|ALT',
        key = 'F14',
        action = wezterm.action.SendKey { key = 'F2' },
    },
    {
        mods = 'SHIFT|ALT',
        key = 'F15',
        action = wezterm.action.SendKey { key = 'F3' },
    },
    {
        mods = 'SHIFT|ALT',
        key = 'F16',
        action = wezterm.action.SendKey { key = 'F4' },
    },
    -- Resize
    {
        mods = 'SUPER|ALT',
        key = 'F13',
        action = wezterm.action.SendKey { key = 'F5' },
    },
    {
        mods = 'SUPER|ALT',
        key = 'F14',
        action = wezterm.action.SendKey { key = 'F6' },
    },
    {
        mods = 'SUPER|ALT',
        key = 'F15',
        action = wezterm.action.SendKey { key = 'F7' },
    },
    {
        mods = 'SUPER|ALT',
        key = 'F16',
        action = wezterm.action.SendKey { key = 'F8' },
    },
    -- Tab Move
    {
        mods = 'SHIFT|ALT|SUPER',
        key = 'F13',
        action = wezterm.action.SendKey { key = 'F9' },
    },
    {
        mods = 'SHIFT|ALT|SUPER',
        key = 'F16',
        action = wezterm.action.SendKey { key = 'F10' },
    },
    -- Window
    {
        mods = 'SHIFT|ALT|SUPER',
        key = 'F14',
        action = wezterm.action.SendKey { key = 'F11' },
    },
    {
        mods = 'SHIFT|ALT|SUPER',
        key = 'F15',
        action = wezterm.action.SendKey { key = 'F12' },
    },
    {
        mods = 'SHIFT|ALT|SUPER',
        key = 'F17',
        action = wezterm.action.SendKey { mods = 'ALT', key = '.' },
    },
    {
        mods = 'ALT',
        key = 'F18',
        action = wezterm.action.SendKey { mods = 'ALT', key = ']' },
    },
    {
        mods = 'SHIFT|ALT',
        key = 'F18',
        action = wezterm.action.SendKey { mods = 'ALT', key = '[' },
    },
    {
        mods = 'ALT|SUPER',
        key = 'F18',
        action = wezterm.action.SendKey { mods = 'ALT', key = '/' },
    },
    -- Tab
    {
        mods = 'ALT',
        key = 'F17',
        action = wezterm.action.SendKey { key = 'PageUp' },
    },
    {
        mods = 'SHIFT|ALT',
        key = 'F17',
        action = wezterm.action.SendKey { key = 'PageDown' },
    },
    {
        mods = 'ALT|SUPER',
        key = 'F17',
        action = wezterm.action.SendKey { mods = 'ALT', key = ',' },
    },
    -- Session
    {
        mods = 'ALT',
        key = 'F19',
        action = wezterm.action.SendKey { mods = 'ALT', key = ';' },
    },
}

return config
