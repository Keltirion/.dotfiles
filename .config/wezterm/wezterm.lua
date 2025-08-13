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
config.window_close_confirmation = 'NeverPrompt'

-- For example, changing the color scheme:
-- config.color_scheme_dirs = {"~/.config/wezterm/colors"}
config.color_scheme = 'Catppuccin Mocha'

-- Apperance
config.window_background_opacity = 1.0
config.window_decorations = 'RESIZE'

-- Tab bar
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_max_width = 25
config.show_tab_index_in_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = true

-- Cursor
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 800
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"

config.max_fps = 240
config.animation_fps = 240

local process_icons = {
	['ssh'] = { {
		Text = wezterm.nerdfonts.md_ssh
	} },
	['docker'] = { {
		Text = wezterm.nerdfonts.linux_docker
	} },
	['docker-compose'] = { {
		Text = wezterm.nerdfonts.linux_docker
	} },
	['kuberlr'] = { {
		Text = wezterm.nerdfonts.linux_docker
	} },
	['kubectl'] = { {
		Text = wezterm.nerdfonts.md_kubernetes
	} },
	['k9s'] = { {
		Text = wezterm.nerdfonts.md_kubernetes
	} },
	['terraform'] = { {
		Text = wezterm.nerdfonts.md_terraform
	} },
	['terragrunt'] = { {
		Text = wezterm.nerdfonts.md_terraform
	} },
	['nvim'] = { {
		Text = wezterm.nerdfonts.custom_neovim
	} },
	['neovim'] = { {
		Text = wezterm.nerdfonts.custom_neovim
	} },
	['vim'] = { {
		Text = wezterm.nerdfonts.dev_vim
	} },
	['lazygit'] = { {
		Text = wezterm.nerdfonts.cod_git_pull_request
	} },
	['node'] = { {
		Text = wezterm.nerdfonts.mdi_hexagon
	} },
	['zsh'] = { {
		Text = wezterm.nerdfonts.cod_terminal
	} },
	['bash'] = { {
		Text = wezterm.nerdfonts.cod_terminal_bash
	} },
	['btm'] = { {
		Text = wezterm.nerdfonts.mdi_chart_donut_variant
	} },
	['htop'] = { {
		Text = wezterm.nerdfonts.mdi_chart_donut_variant
	} },
	['cargo'] = { {
		Text = wezterm.nerdfonts.dev_rust
	} },
	['go'] = { {
		Text = wezterm.nerdfonts.mdi_language_go
	} },
	['lazydocker'] = { {
		Text = wezterm.nerdfonts.linux_docker
	} },
	['git'] = { {
		Text = wezterm.nerdfonts.dev_git
	} },
	['lua'] = { {
		Text = wezterm.nerdfonts.seti_lua
	} },
	['wget'] = { {
		Text = wezterm.nerdfonts.mdi_arrow_down_box
	} },
	['curl'] = { {
		Text = wezterm.nerdfonts.mdi_flattr
	} },
	['gh'] = { {
		Text = wezterm.nerdfonts.dev_github_badge
	} }
}

local function get_current_working_dir(tab)
	local current_dir = tostring(tab.active_pane.current_working_dir)
	local HOME_DIR = string.format('file://%s', os.getenv('HOME'))

	return current_dir == HOME_DIR and '.' or string.gsub(current_dir, '(.*[/\\])(.*)', '%2')
end

local function get_process(tab)
	local process_name = string.gsub(tab.active_pane.foreground_process_name, '(.*[/\\])(.*)', '%2')
	local process_name_string = string.format('[%s]', process_name)

	local icon = process_icons[process_name]

	return {
		icon = icon[1].Text,
		process_name = process_name_string
	}
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
	local has_unseen_output = false
	if not tab.is_active then
		for _, pane in ipairs(tab.panes) do
			if pane.has_unseen_output then
				has_unseen_output = true
				break
			end
		end
	end

	local tab_index = tab.tab_index + 1
	local result = get_process(tab)
	local tab_cwd

	if result.icon == nil or result.process_name == nil then
		tab_cwd = "No process found"
	end

	if result.process_name == '[ssh]' then
		tab_cwd = 'on remote'
	else
		tab_cwd = get_current_working_dir(tab)
	end

	local title = string.format('%s. %s ~ %s  ', tab_index, result.icon, tab_cwd)

	if has_unseen_output then
		return { {
			Foreground = {
				Color = 'Orange'
			}
		}, {
			Text = title
		} }
	end

	return { {
		Text = title
	} }
end)

-- wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
-- 	local zoomed = ''
-- 	if tab.active_pane.is_zoomed then
-- 		zoomed = '[Z] '
-- 	end
--
-- 	local index = ''
-- 	if #tabs > 1 then
-- 		index = string.format(' %d/%d ', tab.tab_index + 1, #tabs)
-- 	end
--
-- 	local tab_cwd = get_current_working_dir(tab)
-- 	local _, fallback = get_process(tab)
--
-- 	local title = string.format('%s - %s -> %s', wezterm.mux.get_active_workspace(), tab_cwd, wezterm.format(fallback))
--
-- 	return zoomed .. title .. index
-- end)

wezterm.on('update-right-status', function(window)
	if not window:get_dimensions().is_full_screen then
		window:set_right_status("")
		return
	end

	window:set_right_status(wezterm.format({ {
		Foreground = {
			Color = '#808080'
		}
	}, {
		Text = wezterm.strftime(' %R ')
	} }))
end)

-- Fonts
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 15

config.window_frame = {
	font = wezterm.font 'JetBrainsMono Nerd Font',
	font_size = 15
}

wezterm.on('update-right-status', function(window, pane)
	window:set_right_status(window:active_workspace())
end)

-- Keys
config.leader = {
	key = 'Space',
	mods = 'CTRL',
	timeout_milliseconds = 2000
}

config.ssh_domains = {
	{
		name = 'zeiss.com',
		remote_address = 'llonczynski',
		username = 'llonczynski'
	}
}

config.keys = { -- Workspaces
	{
		key = '9',
		mods = 'LEADER',
		action = act.SwitchToWorkspace {
			name = 'default'
		}
	},
	{
		key = '1',
		mods = 'LEADER',
		action = act.SwitchToWorkspace {
			name = 'Zeiss',
			spawn = {
				cwd = '/Users/lech/Repositories/Zeiss/'
			}
		}
	},
	{
		key = '2',
		mods = 'LEADER',
		action = act.SwitchToWorkspace {
			name = 'Phlex',
			spawn = {
				cwd = '/Users/lech/Repositories/Phlex/'
			}
		}
	},
	{
		key = '3',
		mods = 'LEADER',
		action = act.SwitchToWorkspace {
			name = 'Softwaremind',
			spawn = {
				cwd = '/Users/lech/Repositories/Softwaremind/'
			}
		}
	},
	{
		key = '0',
		mods = 'LEADER',
		action = act.SwitchToWorkspace {
			name = 'Personal',
			spawn = {
				cwd = '/Users/lech/Repositories/Personal/'
			}
		}
	},
	{
		key = 'w',
		mods = 'LEADER',
		action = wezterm.action.CloseCurrentPane {
			confirm = false
		}
	}, -- Splits
	{
		key = 'x',
		mods = 'LEADER',
		action = wezterm.action.SplitVertical {
			domain = 'CurrentPaneDomain'
		}
	},
	{
		key = 's',
		mods = 'LEADER',
		action = wezterm.action.SplitHorizontal {
			domain = 'CurrentPaneDomain'
		}
	}, -- Rest
	{
		key = 'f',
		mods = 'CTRL|CMD',
		action = wezterm.action.ToggleFullScreen
	}, {
	key = 'r',
	mods = 'LEADER',
	action = act.ActivateKeyTable {
		name = 'resize_pane',
		one_shot = false
	}
}, {
	key = 'a',
	mods = 'LEADER',
	action = act.ActivateKeyTable {
		name = 'activate_pane',
		timeout_milliseconds = 5000
	}
}, {
	key = 'd',
	mods = 'CMD',
	action = wezterm.action.SplitPane {
		direction = 'Next',
		size = {
			Percent = 50
		}
	}
}, -- Resize pane
	{
		key = 'h',
		mods = 'OPT|SHIFT',
		action = act.AdjustPaneSize { 'Left', 1 }
	}, {
	key = 'l',
	mods = 'OPT|SHIFT',
	action = act.AdjustPaneSize { 'Right', 1 }
}, {
	key = 'k',
	mods = 'OPT|SHIFT',
	action = act.AdjustPaneSize { 'Up', 1 }
}, {
	key = 'j',
	mods = 'OPT|SHIFT',
	action = act.AdjustPaneSize { 'Down', 1 }
}, -- Swap pane
	{
		key = 'h',
		mods = 'OPT',
		action = act.ActivatePaneDirection 'Left'
	}, {
	key = 'l',
	mods = 'OPT',
	action = act.ActivatePaneDirection 'Right'
}, {
	key = 'k',
	mods = 'OPT',
	action = act.ActivatePaneDirection 'Up'
}, {
	key = 'j',
	mods = 'OPT',
	action = act.ActivatePaneDirection 'Down'
} }

config.key_tables = {
	resize_pane = { {
		key = 'LeftArrow',
		action = act.AdjustPaneSize { 'Left', 1 }
	}, {
		key = 'h',
		action = act.AdjustPaneSize { 'Left', 1 }
	}, {
		key = 'RightArrow',
		action = act.AdjustPaneSize { 'Right', 1 }
	}, {
		key = 'l',
		action = act.AdjustPaneSize { 'Right', 1 }
	}, {
		key = 'UpArrow',
		action = act.AdjustPaneSize { 'Up', 1 }
	}, {
		key = 'k',
		action = act.AdjustPaneSize { 'Up', 1 }
	}, {
		key = 'DownArrow',
		action = act.AdjustPaneSize { 'Down', 1 }
	}, {
		key = 'j',
		action = act.AdjustPaneSize { 'Down', 1 }
	}, -- Cancel the mode by pressing escape
		{
			key = 'Escape',
			action = 'PopKeyTable'
		} },
	activate_pane = { {
		key = 'LeftArrow',
		action = act.ActivatePaneDirection 'Left'
	}, {
		key = 'h',
		action = act.ActivatePaneDirection 'Left'
	}, {
		key = 'RightArrow',
		action = act.ActivatePaneDirection 'Right'
	}, {
		key = 'l',
		action = act.ActivatePaneDirection 'Right'
	}, {
		key = 'UpArrow',
		action = act.ActivatePaneDirection 'Up'
	}, {
		key = 'k',
		action = act.ActivatePaneDirection 'Up'
	}, {
		key = 'DownArrow',
		action = act.ActivatePaneDirection 'Down'
	}, {
		key = 'j',
		action = act.ActivatePaneDirection 'Down'
	} }
}

return config
