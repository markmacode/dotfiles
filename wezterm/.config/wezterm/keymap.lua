local wezterm = require("wezterm")
local M = {}
local act = wezterm.action
local sessionizer = require("sessionizer")

function M.apply(config)
  local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

  config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 3000 }

  config.keys = {
    {
      key = "o",
      mods = "LEADER",
      action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
    },
    {
      key = "t",
      mods = "LEADER",
      action = wezterm.action_callback(sessionizer.toggle),
    },

    -- Opt-Left and Opt-Right will jump words on MacOS
    { key = "LeftArrow", mods = "OPT", action = act.SendKey({ key = "b", mods = "ALT" }) },
    { key = "RightArrow", mods = "OPT", action = act.SendKey({ key = "f", mods = "ALT" }) },

    -- Navigation
    { key = "h", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-left") },
    { key = "j", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-down") },
    { key = "k", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-up") },
    { key = "l", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-right") },

    -- Pane
    {
      key = "v",
      mods = "LEADER",
      action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "s",
      mods = "LEADER",
      action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "q",
      mods = "LEADER",
      action = act.CloseCurrentPane({ confirm = true }),
    },
  }
end

return M
