local wezterm = require 'wezterm'
local act = wezterm.action

return {
    {
        key = 'y',
        mods = 'LEADER',
        action = act.CopyTo 'ClipboardAndPrimarySelection',
    },
    {
        key = 'p',
        mods = 'LEADER',
        action = act.PasteFrom 'Clipboard',
    },
}