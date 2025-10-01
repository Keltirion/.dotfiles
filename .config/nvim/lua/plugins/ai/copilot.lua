return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_no_tab_map = true

		vim.keymap.set('i', '<C-CR>', 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false
		})
		vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-word)', {
			noremap = true,
			silent = true
		})
		vim.keymap.set('i', '<C-.>', '<Plug>(copilot-next)', {
			noremap = true,
			silent = true
		})
		vim.keymap.set('i', '<C-,>', '<Plug>(copilot-previous)', {
			noremap = true,
			silent = true
		})
	end,
}
