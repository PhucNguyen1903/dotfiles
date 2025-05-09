local wezterm = require 'wezterm'

-- Set tab title and background based on domain
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the domain from the active pane in that tab
  return tab_info.active_pane.domain_name
end

function tab_color(tab_info)
  if string.sub(tab_info.active_pane.domain_name, 1, 4) == "SSH:" then
    return "#f5bde6"
  elseif tab_info.active_pane.domain_name == "unix" then
    return "#a6da95"
  else
    return "#b7bdf8"
  end
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  if tab.is_active then
    return {
      {Background={Color=tab_color(tab)}},
      { Text = ' ' .. tab.tab_index+1 .. ':' ..  tab_title(tab) .. ' ' },
    }
  else
    return {
      {Foreground={Color=tab_color(tab)}},
      { Text = ' ' .. tab.tab_index+1 .. ':' ..  tab_title(tab) .. ' ' },
    }
  end
end)

local function config_tab_bar(config) 
  config.tab_bar_at_bottom = true
  config.use_fancy_tab_bar = false
  config.tab_and_split_indices_are_zero_based = true
end

return {
  config_tab_bar = config_tab_bar
}

