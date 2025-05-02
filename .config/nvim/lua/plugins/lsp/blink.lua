return {
	'saghen/blink.cmp',
	dependencies = {
		'Kaiser-Yang/blink-cmp-avante',
	},
	version = '*',
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = { preset = 'enter' },
		signature = {
			window = {
				border = 'rounded',
			},
		},
		completion = {
			menu = {
				border = 'rounded',
				draw = {
					columns = {
						{ "label",    "label_description", gap = 1 },
						{ "kind_icon" },
						{ "kind" }
					}
				}
			},
			documentation = {
				window = {
					border = 'single'
				},
				auto_show = true,
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				}
			}
		},
		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = 'mono'
		},

		sources = {
			default = { 'avante', 'snippets', 'lsp', 'path', 'buffer' },
			providers = {
				avante = {
					module = 'blink-cmp-avante',
					name = 'Avante',
					opts = {
						-- options for blink-cmp-avante
					}
				}
			},
		},
	},
}
