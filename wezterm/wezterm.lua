local wezterm = require "wezterm"

local config = {
  font = wezterm.font_with_fallback {
    "Roboto Mono",
    "Noto Sans JP",
  },
  font_size = 11.0,
  window_background_opacity = 0.85,
}

if string.find(wezterm.target_triple, "windows") then
  config.default_prog = { "pwsh", "-NoLogo" }
end

return config
