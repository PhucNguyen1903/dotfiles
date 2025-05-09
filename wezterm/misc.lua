local wezterm = require 'wezterm'

enable_scroll_bar=true
exit_behavior="Hold"

local function config_misc(config)
  config.macos_window_background_blur = 80
  config.window_background_opacity = 0.8

  config.automatically_reload_config = true

  config.window_close_confirmation = 'AlwaysPrompt'
  config.window_decorations = 'RESIZE'

  config.initial_rows = 40
  config.initial_cols = 150

  config.default_cursor_style = 'SteadyBar'
  config.color_scheme = 'Catppuccin Mocha'

  config.font = wezterm.font('JetBrains Mono', { 
    weight = 'Medium',
  })
  config.font_size = 15
end

return {
  config_misc = config_misc
}
