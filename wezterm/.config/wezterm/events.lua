-- Got this from the Navigator.nvim wiki
-- https://github.com/numToStr/Navigator.nvim/wiki/WezTerm-Integration

local module = {}
local wezterm = require("wezterm")
local act = wezterm.action

local function is_vi_process(pane)
  -- get_foreground_process_name On Linux, macOS and Windows,
  -- the process can be queried to determine this path. Other operating systems
  -- (notably, FreeBSD and other unix systems) are not currently supported
  return pane:get_foreground_process_name():find("n?vim") ~= nil or pane:get_title():find("n?vim") ~= nil
end

local function conditional_activate_pane(window, pane, pane_direction, vim_direction)
  if is_vi_process(pane) then
    window:perform_action(
      -- This should match the keybinds you set in Neovim.
      act.SendKey({ key = vim_direction, mods = "CTRL" }),
      pane
    )
  else
    window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
  end
end

function module.apply(config)
  wezterm.on("ActivatePaneDirection-right", function(window, pane)
    conditional_activate_pane(window, pane, "Right", "l")
  end)
  wezterm.on("ActivatePaneDirection-left", function(window, pane)
    conditional_activate_pane(window, pane, "Left", "h")
  end)
  wezterm.on("ActivatePaneDirection-up", function(window, pane)
    conditional_activate_pane(window, pane, "Up", "k")
  end)
  wezterm.on("ActivatePaneDirection-down", function(window, pane)
    conditional_activate_pane(window, pane, "Down", "j")
  end)
end

return module
