local wezterm = require("wezterm")
local colors = require("colors")
local module = {}

local function get_active_workspace(window)
  return wezterm.nerdfonts.md_cube_outline .. " " .. window:active_workspace()
end

function module.apply(config)
  wezterm.on("format-tab-title", function(tab, tabs, panes, _config, hover, max_width)
    local title = tab.active_pane.title

    if tab.tab_title and #tab.tab_title > 0 then
      title = tab.tab_title
    end

    if tab.is_active then
      return {
        { Text = " " .. (tab.tab_index + 1) .. ": " .. title .. " " },
      }
    else
      return {
        { Text = " " .. (tab.tab_index + 1) .. ": " .. title .. " " },
      }
    end
  end)

  wezterm.on("update-right-status", function(window, pane)
    local scheme_name = colors.scheme_name(window:get_appearance())
    local scheme = wezterm.color.get_builtin_schemes()[scheme_name]

    window:set_right_status(wezterm.format({
      { Background = { Color = scheme.tab_bar.background } },
      { Foreground = { Color = scheme.brights[5] } },
      { Text = " " .. get_active_workspace(window) .. " " },
    }))
  end)
end

return module
