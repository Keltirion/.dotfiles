-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'

-- Apperance
config.window_decorations = 'RESIZE'
config.use_fancy_tab_bar = true
-- config.colors = {
-- 	tab_bar = {
-- 		background = '#2e3440',
-- 		active_tab = {
-- 			bg_color = '#2e3440',
-- 			fg_color = '#c0c0c0',
-- 		},
-- 		inactive_tab = {
-- 			bg_color = '#4c566a',
-- 			fg_color = '#c0c0c0',
-- 		},
-- 		new_tab = {
-- 			bg_color = '#4c566a',
-- 			fg_color = '#c0c0c0',
-- 		},
-- 	},
-- }

-- Tab bar
config.hide_tab_bar_if_only_one_tab = true

-- Fonts
config.font = wezterm.font 'CaskaydiaCove Nerd Font'
config.font_size = 16

config.window_frame = {

}

-- Keys
config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
	{
		key = 'f',
		mods = 'CTRL|CMD',
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = 'r',
		mods = 'LEADER',
		action = act.ActivateKeyTable {
			name = 'resize_pane',
			one_shot = false,
		},
	},
	{
		key = 'a',
		mods = 'LEADER',
		action = act.ActivateKeyTable {
			name = 'activate_pane',
			timeout_milliseconds = 5000,
		},
	},
	{
		key = 'v',
		mods = 'OPT|CTRL',
		action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
	},
	{
		key = 'h',
		mods = 'OPT|CTRL',
		action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
	},
	-- Resize pane
	{ key = 'h', mods = 'OPT|SHIFT', action = act.AdjustPaneSize { 'Left', 1 } },
	{ key = 'l', mods = 'OPT|SHIFT', action = act.AdjustPaneSize { 'Right', 1 } },
	{ key = 'k', mods = 'OPT|SHIFT', action = act.AdjustPaneSize { 'Up', 1 } },
	{ key = 'j', mods = 'OPT|SHIFT', action = act.AdjustPaneSize { 'Down', 1 } },
	-- Swap pane
	{ key = 'h', mods = 'OPT', action = act.ActivatePaneDirection 'Left' },
	{ key = 'l', mods = 'OPT', action = act.ActivatePaneDirection 'Right' },
	{ key = 'k', mods = 'OPT', action = act.ActivatePaneDirection 'Up' },
	{ key = 'j', mods = 'OPT', action = act.ActivatePaneDirection 'Down' },
}

config.key_tables = {
	resize_pane = {
		{ key = 'LeftArrow',  action = act.AdjustPaneSize { 'Left', 1 } },
		{ key = 'h',          action = act.AdjustPaneSize { 'Left', 1 } },
		{ key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
		{ key = 'l',          action = act.AdjustPaneSize { 'Right', 1 } },
		{ key = 'UpArrow',    action = act.AdjustPaneSize { 'Up', 1 } },
		{ key = 'k',          action = act.AdjustPaneSize { 'Up', 1 } },
		{ key = 'DownArrow',  action = act.AdjustPaneSize { 'Down', 1 } },
		{ key = 'j',          action = act.AdjustPaneSize { 'Down', 1 } },

		-- Cancel the mode by pressing escape
		{ key = 'Escape',     action = 'PopKeyTable' },
	},
	activate_pane = {
		{ key = 'LeftArrow',  action = act.ActivatePaneDirection 'Left' },
		{ key = 'h',          action = act.ActivatePaneDirection 'Left' },
		{ key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
		{ key = 'l',          action = act.ActivatePaneDirection 'Right' },
		{ key = 'UpArrow',    action = act.ActivatePaneDirection 'Up' },
		{ key = 'k',          action = act.ActivatePaneDirection 'Up' },
		{ key = 'DownArrow',  action = act.ActivatePaneDirection 'Down' },
		{ key = 'j',          action = act.ActivatePaneDirection 'Down' },
	},
}

-- and finally, return the configuration to wezterm
return config
