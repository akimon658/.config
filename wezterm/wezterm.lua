local wezterm = require "wezterm"

local config = {
  font = wezterm.font_with_fallback {
    "Roboto Mono",
    "Noto Sans JP",
  },
  font_size = 14.0,
  window_background_opacity = 0.8,
}

if string.find(wezterm.target_triple, "windows") then
  config.default_prog = { "pwsh", "-NoLogo" }
end

wezterm.on("gui-startup", function()
  local _, _, window = wezterm.mux.spawn_window {}
  window:gui_window():maximize()
end)

if string.find(wezterm.target_triple, "apple") then
  wezterm.on("window-focus-changed", function(window, _)
    if window:is_focused() then
      os.execute "osascript -e 'tell application \"System Events\" to key code 102'"
    end
  end)
end

return config
