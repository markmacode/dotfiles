local wezterm = require("wezterm")
local M = {}

function M.is_windows()
  -- Thank you for the hack mnicky https://stackoverflow.com/a/14425862
  return package.config:sub(1, 1) == "\\"
end

function M.apply(config)
  if not M.is_windows() then
    wezterm.log_info("Cannot apply Windows config (not on Windows)")
    return
  end
  wezterm.log_info("Applying Windows config")

  config.font_size = 12
  config.front_end = "WebGpu"
  config.webgpu_power_preference = "HighPerformance"
  -- This makes my work laptop actually responsive!!
  config.webgpu_preferred_adapter = {
    backend = "Dx12",
    device = 39745,
    device_type = "IntegratedGpu",
    name = "Intel(R) UHD Graphics",
    vendor = 32902,
  }
end

return M
