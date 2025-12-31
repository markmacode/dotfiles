-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- Font stuff
local font = "JetBrainsMono Nerd Font"
local font_size = 14
config.font_size = font_size
config.font = wezterm.font({
  family = font,
  harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  weight = "Regular",
})
config.font_rules = {
  -- Bold and non-italic
  {
    intensity = "Bold",
    italic = false,
    font = wezterm.font({
      family = font,
      weight = "Bold",
    }),
  },

  -- Bold and italic
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font({
      family = font,
      weight = "Bold",
      style = "Italic",
    }),
  },
}
config.line_height = 1

config.keys = {
  -- Presentation mode with zoomed in text
  {
    key = "j",
    mods = "CMD|ALT|CTRL",
    action = wezterm.action_callback(function(window, pane)
      -- window:toggle_fullscreen()
      local zoom_size = 20
      local current_overrides = window:get_config_overrides()
      if current_overrides ~= nil and current_overrides.font_size ~= font_size then
        window:set_config_overrides({ font_size = font_size })
        return
      end
      window:set_config_overrides({ font_size = zoom_size })
    end),
  },

  -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
  {
    key = "LeftArrow",
    mods = "OPT",
    action = act.SendKey({ key = "b", mods = "ALT" }),
  },
  {
    key = "RightArrow",
    mods = "OPT",
    action = act.SendKey({ key = "f", mods = "ALT" }),
  },
}

-- Window stuff
config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = true
config.enable_scroll_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = "0.5cell",
  bottom = "0.5cell",
}

require("colors")
require("windows").apply(config)
return config
