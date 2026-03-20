local wezterm = require("wezterm")
local colors = require("colors")
local M = {}

local function get_active_workspace(window)
  return wezterm.nerdfonts.md_cube_outline .. " " .. window:active_workspace()
end

local function tab_title(tab)
  local process_name = tab.active_pane.foreground_process_name or ""
  local exec_name = process_name:match("([^/\\]+)$")

  if exec_name == "lazygit" then
    return "lazygit"
  elseif exec_name == "nvim" then
    return "neovim"
  end

  local title = tab.tab_title
  if title and #title > 0 then
    return title
  end
end

function M.apply(config)
  wezterm.on("format-tab-title", function(tab, tabs, panes, _config, hover, max_width)
    local title = tab_title(tab)
    return {
      { Text = " " .. (tab.tab_index + 1) .. ": " .. title .. " " },
    }
  end)

  wezterm.on("update-right-status", function(window, pane)
    local scheme_name = colors.scheme_name(window:get_appearance())
    local scheme = wezterm.color.get_builtin_schemes()[scheme_name]

    window:set_right_status(wezterm.format({
      { Foreground = { Color = scheme.foreground } },
      { Text = " " .. get_active_workspace(window) .. " " },
    }))
  end)
end

return M
