local module = {}

function module.apply(config)
    local fg0 = "#d6d6d7" -- Lighter fg
    local fg1 = "#cdcecf" -- Default fg
    local fg2 = "#aeafb0" -- Darker fg (status line)
    local fg3 = "#71839b" -- Darker fg (line numbers, fold colums)

    local bg0 = "#131a24" -- Dark bg (status line and float)
    local bg1 = "#192330" -- Default bg
    local bg2 = "#212e3f" -- Lighter bg (colorcolm folds)
    local bg3 = "#29394f" -- Lighter bg (cursor line)
    local bg4 = "#39506d" -- Conceal, border fg

    local bgx = "#0f151c"
    local bgy = "#2c3c54"

    config.color_scheme = 'nightfox'
    config.window_frame = {
        -- The overall background color of the tab bar when
        -- the window is focused
        active_titlebar_bg = bgx,

        -- The overall background color of the tab bar when
        -- the window is not focused
        inactive_titlebar_bg = bg4,
    }
    config.colors = {
        tab_bar = {
            -- The color of the inactive tab bar edge/divider
            inactive_tab_edge = fg3,

            -- The active tab is the one that has focus in the window
            active_tab = {
                bg_color = bg1,
                fg_color = fg0,
            },

            -- Inactive tabs are the tabs that do not have focus
            inactive_tab = {
                bg_color = bg2,
                fg_color = fg2,
            },

            -- You can configure some alternate styling when the mouse pointer
            -- moves over inactive tabs
            inactive_tab_hover = {
                bg_color = bg4,
                fg_color = fg0,
            },

            -- The new tab button that let you create new tabs
            new_tab = {
                bg_color = bg3,
                fg_color = fg2,
            },

            -- You can configure some alternate styling when the mouse pointer
            -- moves over the new tab button
            new_tab_hover = {
                bg_color = bg4,
                fg_color = fg0,
            },
        },
    }
end

return module
