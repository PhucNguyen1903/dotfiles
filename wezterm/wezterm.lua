-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Start up gui config
local gui_startup = require 'gui_startup'

-- Import session-manager
local session = require 'session'

-- This will hold the configuration.
local config = wezterm.config_builder()

local windows_padding = require 'windows_padding'
windows_padding.config_windows_padding(config)

local tab_bar = require 'tab_bar'
tab_bar.config_tab_bar(config)

local keys = require 'keys'
keys.config_keys(config)

local launch_menu = require 'launch_menu'
launch_menu.config_launch_menu(config)

local misc = require 'misc'
misc.config_misc(config)

local sample_session = require 'sample_session'

-- and finally, return the configuration to wezterm
return config
