local wezterm = require "wezterm"

local config = {
  font = wezterm.font_with_fallback {
    "Roboto Mono",
    "Noto Sans JP",
  },
  font_size = 13.0,
  window_background_opacity = 0.8,
  window_decorations = "INTEGRATED_BUTTONS|RESIZE",
}

if string.find(wezterm.target_triple, "windows") then
  config.default_prog = { "pwsh", "-NoLogo" }
end

---@param path string
---@return string
local function trim_path(path)
  local s = string.gsub(path, "(.*[/\\])(.*)", "%2")

  return s
end

---@type { [string]: string }
local process_icons = {
  ["nvim"] = wezterm.nerdfonts.custom_neovim,
  ["zsh"] = wezterm.nerdfonts.dev_terminal,
}

wezterm.on("format-tab-title", function(tab, _, _, _, _, _)
  local pane = tab.active_pane
  local process_name = trim_path(pane.foreground_process_name)
  ---@type string
  local cwd = pane.current_working_dir.file_path

  return (process_icons[process_name] or process_name .. " on") .. " " .. trim_path(cwd)
end)

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
