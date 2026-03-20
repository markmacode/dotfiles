-- Inspired by this post: https://github.com/wezterm/wezterm/discussions/4796
local wezterm = require("wezterm")
local act = wezterm.action
local colors = require("colors")

local M = {}

local fd = "/Users/mbromell/.homebrew/bin/fd"

M.toggle = function(window, pane)
  local home = wezterm.home_dir

  -- These are the entries for the selector. With some default paths.
  local projects = {
    { id = home .. "/dotfiles", label = "dotfiles" },
  }

  -- Finding other entries for the selector under using 'fd'
  local success, stdout, stderr = wezterm.run_child_process({
    fd,
    home .. "/me",
    "--max-depth=1",
    "--type=directory",
    "--type=symlink",
    "--full-path",
    home .. "/me/repos",
  })

  if not success then
    wezterm.log_error("Failed to run fd: " .. stderr)
    return
  end

  for path in stdout:gmatch("([^\n]*)\n?") do
    -- Remove trailing '/' and then remove leading text until the final '/'
    local basename = path:gsub("/+$", ""):gsub(".*/", "")
    table.insert(projects, { label = tostring(basename), id = tostring(path) })
  end

  window:perform_action(
    act.InputSelector({
      action = wezterm.action_callback(function(win, _, id, label)
        if not id and not label then
          wezterm.log_info("Cancelled")
        else
          wezterm.log_info("Selected " .. label)
          win:perform_action(act.SwitchToWorkspace({ name = label, spawn = { label = label, cwd = id } }), pane)
          -- Forcing a reload of the configuration so that colors get applied correctly
          win:perform_action(act.ReloadConfiguration, pane)
        end
      end),
      fuzzy = true,
      fuzzy_description = "Select Project: ",
      choices = projects,
    }),
    pane
  )
end

return M
