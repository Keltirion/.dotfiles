return {
 		'nvim-tree/nvim-tree.lua',
 		version = 'nightly',
 		dependencies = {
 			'nvim-tree/nvim-web-devicons',
 		},

		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			vim.opt.termguicolors = true

			require("nvim-tree").setup({
				view = {
					preserve_window_proportions = true,
					width = 40,
				},
				renderer = {
					root_folder_label = false,
					highlight_git = true,
					icons = {
						show = {
							git = false,
						}
					}
				},
				filters = {
					custom = {
						"^\\.git"
					}
				}
			})
		end
}
