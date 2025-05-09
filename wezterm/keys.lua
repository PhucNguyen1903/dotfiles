local wezterm = require 'wezterm'

local function config_keys(config)
  config.leader = { key = 'q', mods = 'OPT', timeout_miliseconds = 2000 }
  config.keys = {
    {
      mods = 'SHIFT',
      key = 'UpArrow',
      action = wezterm.action.ScrollByLine(-3),
    },
    {
      mods = 'SHIFT',
      key = 'DownArrow',
      action = wezterm.action.ScrollByLine(3),
    },
    {
      mods = 'LEADER',
      key = '\\',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      mods = 'LEADER',
      key = '-',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
    {
      key = 'LeftArrow',
      mods = 'OPT',
      action = wezterm.action.SendKey {
        key = 'b',
        mods = 'ALT',
      },
    },
    {
      key = 'RightArrow',
      mods = 'OPT',
      action = wezterm.action.SendKey { key = 'f', mods = 'ALT' },
    },
    {
      mods = 'LEADER',
      key = 't',
      action = wezterm.action.SpawnTab "CurrentPaneDomain",
    },
    {
      mods = 'CMD',
      key = 'w',
      action = wezterm.action.CloseCurrentTab { confirm = true },
    },
    {
      mods = 'LEADER',
      key = 'x',
      action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
      mods = 'SHIFT',
      key = 'RightArrow',
      action = wezterm.action.ActivateTabRelative(1), 
    },
    {
      mods = 'SHIFT',
      key = 'LeftArrow',
      action = wezterm.action.ActivateTabRelative(-1), 
    },
    {
      mods = 'LEADER',
      key = 'w',
      action = wezterm.action.ShowTabNavigator,
    },
    {
      mods = 'LEADER',
      key = 'y',
      action = wezterm.action.ActivateCopyMode,
    },
    {
      mods = 'OPT',
      key = 'l',
      action = wezterm.action.ShowLauncher,
    },
    {
      mods = 'LEADER',
      key = 'S',
      action = wezterm.action { EmitEvent = "save_session" },
    },
    {
      mods = 'LEADER',
      key = 'L',
      action = wezterm.action { EmitEvent = "load_session" },
    },
    {
      mods = 'LEADER',
      key = 'R',
      action = wezterm.action { EmitEvent = "restore_session" },
    },
    {
      key = 'p',
      mods = 'LEADER',
      action = wezterm.action.ShowLauncherArgs { flags = 'WORKSPACES' },
    },
    {
      key = 's',
      mods = 'LEADER',
      action = wezterm.action.ShowLauncherArgs { flags = 'DOMAINS|FUZZY' },
    },
    {
      key = 'LeftArrow',
      mods = 'CTRL|OPT',
      action = wezterm.action.AdjustPaneSize { 'Left', 5 },
    },
    {
      key = 'RightArrow',
      mods = 'CTRL|OPT',
      action = wezterm.action.AdjustPaneSize { 'Right', 5 },
    },
    {
      key = 'DownArrow',
      mods = 'CTRL|OPT',
      action = wezterm.action.AdjustPaneSize { 'Down', 5 },
    },
    {
      key = 'UpArrow',
      mods = 'CTRL|OPT',
      action = wezterm.action.AdjustPaneSize { 'Up', 5 },
    },
    {
      key = '.',
      mods = 'LEADER',
      action = wezterm.action.TogglePaneZoomState,
    },
  }
end

return {
  config_keys = config_keys
}
