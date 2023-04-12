require('lualine').setup {
	options = {
		theme = 'nord',
		disabled_filetypes = {
			'packer',
			'NvimTree'
		},
		section_separators = { left = ' ', right = ' ' },
		component_separators = { left = '|', right = '|' },
		globalstatus = false
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = { 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { '' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	}
}
