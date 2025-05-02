return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
	config = function()
		local function get_schema()
			local schema = require("yaml-companion").get_buf_schema(0)
			if schema.result[1].name == "none" then
				return ""
			end
			return schema.result[1].name
		end

		require('lualine').setup {
			options = {
				theme = 'catppuccin',
				disabled_filetypes = {
					'packer',
					'NvimTree'
				},
				section_separators = { left = '', right = ' ' },
				component_separators = { left = '', right = '' },
				globalstatus = true
			},
			sections = {
				lualine_a = { { 'tabs', mode = 2 } },
				lualine_b = {},
				lualine_c = {},
				lualine_x = { 'filename', 'branch', 'diff', 'diagnostics' },
				lualine_y = { 'filetype', 'progress', 'fileformat' },
				lualine_z = { 'mode' }
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			}
		}
	end
}
