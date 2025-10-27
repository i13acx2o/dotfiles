local wezterm = require("wezterm")
local config = {}

config.enable_wayland = true
config.window_decorations = "NONE"
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
config.enable_tab_bar = false
config.window_background_opacity = 0.93
config.hide_mouse_cursor_when_typing = true
config.automatically_reload_config = true

config.window_padding = {
  left = "1cell",
  right = "1cell",
  top = "0.5cell",
  bottom = "0.5cell",
}

config.inactive_pane_hsb = {
  brightness = 0.1,
}

local act = wezterm.action
config.disable_default_key_bindings = true
config.keys = {
  -- Copy and Paste
  { key = "c", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
  { key = "v", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
  { key = "Insert", mods = "CTRL", action = act.CopyTo("PrimarySelection") },
  { key = "Insert", mods = "SHIFT", action = act.PasteFrom("PrimarySelection") },

  -- Font Resize
  { key = "]", mods = "ALT", action = act.IncreaseFontSize },
  { key = "[", mods = "ALT", action = act.DecreaseFontSize },
  { key = "0", mods = "ALT", action = act.ResetFontSize },

  -- Panes
  { key = ".", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = ",", mods = "ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "z", mods = "ALT", action = act.TogglePaneZoomState },

  { key = "l", mods = "ALT", action = act.ActivatePaneDirection("Right") },
  { key = "h", mods = "ALT", action = act.ActivatePaneDirection("Left") },
  { key = "k", mods = "ALT", action = act.ActivatePaneDirection("Up") },
  { key = "j", mods = "ALT", action = act.ActivatePaneDirection("Down") },

  { key = "l", mods = "ALT|CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
  { key = "h", mods = "ALT|CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
  { key = "k", mods = "ALT|CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
  { key = "j", mods = "ALT|CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },

  { key = "q", mods = "ALT", action = act.CloseCurrentPane({ confirm = true }) },
}

return config
