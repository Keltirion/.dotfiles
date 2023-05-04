local function get_schema()
	local schema = require("yaml-companion").get_buf_schema(0)
	if schema.result[1].name == "none" then
		return ""
	end
	return schema.result[1].name
end

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
		lualine_x = { get_schema, 'filetype', 'progress', 'fileformat'  },
		lualine_y = {},
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
