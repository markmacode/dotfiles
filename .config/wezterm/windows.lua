local wezterm = require 'wezterm'
local module = {}

function module.is_windows()
    -- Thank you for the hack mnicky https://stackoverflow.com/a/14425862
    return package.config:sub(1,1) == "\\"
end

function module.apply(config)
    if not module.is_windows() then
        wezterm.log_info 'Cannot apply Windows config (not on Windows)'
        return
    end
    wezterm.log_info 'Applying Windows config'

    config.font_size = 12
    config.default_domain = 'WSL:Ubuntu-22.04'
    config.front_end = "WebGpu"
    config.webgpu_power_preference = "HighPerformance"
    config.webgpu_preferred_adapter = {
        backend = "Vulkan",
        device = 39745,
        device_type = "IntegratedGpu",
        driver = "Intel Corporation",
        driver_info = "Intel driver",
        name = "Intel(R) UHD Graphics",
        vendor = 32902,
    }
end

return module
