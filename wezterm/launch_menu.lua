local function config_launch_menu(config)
  config.launch_menu = {
    {
      label = 'K9S',
      args = { '/opt/homebrew/bin/k9s' },
      cwd = '$HOME',
    },
  }
end

return {
  config_launch_menu = config_launch_menu
}
