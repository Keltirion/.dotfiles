return {
	'echasnovski/mini.nvim',
	version = false,

	config = function()
		require("mini.files").setup({})
		require("mini.pairs").setup({})
	end
}
