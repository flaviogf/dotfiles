local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.automatically_reload_config = true
config.color_scheme = 'Tokyo Night'
config.default_cursor_style = 'BlinkingBar'
config.enable_tab_bar = false
config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })
config.font_size = 16
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = 'RESIZE'

return config
