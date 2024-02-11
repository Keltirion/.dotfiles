return {
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},

	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.opt.termguicolors = true

		require("nvim-tree").setup({
			view = {
				side = "left",
				preserve_window_proportions = true,
				width = 40,
			},
			renderer = {
				root_folder_label = false,
				highlight_git = true,
				icons = {
					padding = "  ",
					show = {
						git = false,
						file = true,
						folder = true,
						folder_arrow = true,
					},
				},
				indent_markers = {
					enable = true,
				},
			},
			filters = {
				custom = {
					"^\\.git"
				}
			}
		})
	end
}
