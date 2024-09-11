return {
	'nvim-telescope/telescope.nvim',
	version = '0.1.5',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		local builtin = require('telescope.builtin')
		local actions = require('telescope.actions')

		require('telescope').setup {
			defaults = {
				layout_config = {
					vertical = {
						width = 0.9
					}
				},
				mappings = {
					n = {
						["q"] = actions.close,
					},
					i = {
						["<C-q>"] = actions.close
					}
				},
			}
		}

		vim.keymap.set('n', '<leader>ps', function()
			builtin.grep_string({ search = vim.fn.input("grep > ") });
		end)

	end
}
