local wezterm = require 'wezterm'
local module = {}

local dayfox = {
    color_scheme = "dayfox",
    bg0 = "#e4dcd4", -- Dark bg (status line and float)
    bg1 = "#f6f2ee", -- Default bg
    bg2 = "#dbd1dd", -- Lighter bg (colorcolm folds)
    bg3 = "#d3c7bb", -- Lighter bg (cursor line)
    bg4 = "#aab0ad", -- Conceal, border fg
    fg0 = "#302b5d", -- Lighter fg
    fg1 = "#3d2b5a", -- Default fg
    fg2 = "#643f61", -- Darker fg (status line)
    fg3 = "#824d5b", -- Darker fg (line numbers, fold colums)
}
local dawnfox = {
    color_scheme = "dawnfox",
    bg0 = "#ebe5df", -- Dark bg (status line and float)
    bg1 = "#faf4ed", -- Default bg
    bg2 = "#ebe0df", -- Lighter bg (colorcolm folds)
    bg3 = "#ebdfe4", -- Lighter bg (cursor line)
    bg4 = "#bdbfc9", -- Conceal, border fg
    fg0 = "#4c4769", -- Lighter fg
    fg1 = "#575279", -- Default fg
    fg2 = "#625c87", -- Darker fg (status line)
    fg3 = "#a8a3b3", -- Darker fg (line numbers, fold colums)
}
local nightfox = {
    color_scheme = "nightfox",
    bg0 = "#131a24", -- Dark bg (status line and float)
    bg1 = "#192330", -- Default bg
    bg2 = "#212e3f", -- Lighter bg (colorcolm folds)
    bg3 = "#29394f", -- Lighter bg (cursor line)
    bg4 = "#39506d", -- Conceal, border fg
    fg0 = "#d6d6d7", -- Lighter fg
    fg1 = "#cdcecf", -- Default fg
    fg2 = "#aeafb0", -- Darker fg (status line)
    fg3 = "#71839b", -- Darker fg (line numbers, fold colums)
}

local light = dayfox
local dark = nightfox

local function set_colors(config, colors)
    config.window_frame = {
        active_titlebar_bg = colors.bg3,
        inactive_titlebar_bg = colors.bg3,
        font = wezterm.font_with_fallback {
            'Iosevka Aile',
            'Roboto',
        },
        font_size = 13,
    }
    config.colors = {
        tab_bar = {
            inactive_tab_edge = colors.fg3,
            active_tab = {
                bg_color = colors.bg1,
                fg_color = colors.fg0,
            },
            inactive_tab = {
                bg_color = colors.bg3,
                fg_color = colors.fg2,
            },
            inactive_tab_hover = {
                bg_color = colors.bg4,
                fg_color = colors.fg0,
            },
            new_tab = {
                bg_color = colors.bg3,
                fg_color = colors.fg2,
            },
            new_tab_hover = {
                bg_color = colors.bg4,
                fg_color = colors.fg0,
            },
        },
    }
end

function module.apply(config)
    -- Auto change light or dark mode depending on system config
    -- https://wezfurlong.org/wezterm/config/lua/window/get_appearance.html
    wezterm.on('window-config-reloaded', function(window, pane)
        local overrides = window:get_config_overrides() or {}
        local appearance = window:get_appearance()
        if appearance:find 'Light' then
            overrides.color_scheme = light.color_scheme
            set_colors(overrides, light)
        else
            overrides.color_scheme = dark.color_scheme
            set_colors(overrides, dark)
        end
        window:set_config_overrides(overrides)
    end)
end

return module
