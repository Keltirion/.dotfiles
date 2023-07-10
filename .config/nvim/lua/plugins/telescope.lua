return {
	'nvim-telescope/telescope.nvim',
	version = '0.1.1',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-project.nvim',
		'cljoly/telescope-repo.nvim',
	},
	config = function()
		local builtin = require('telescope.builtin')

		require('telescope').setup {
			extensions = {
				repo = {
					list = {
						fd_opts = {
							"--no-ignore-vcs",
						},
						search_dirs = {
							"~/Repositories/",
						},
					},
				},
			},
		}

		vim.keymap.set('n', '<leader>ps', function()
			builtin.grep_string({ search = vim.fn.input("grep > ") });
		end)

		require 'telescope'.load_extension 'project'
		require 'telescope'.load_extension 'repo'
	end
}
