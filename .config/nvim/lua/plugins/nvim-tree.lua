-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
	view = {
		width = 40,
	},
	renderer = {
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
