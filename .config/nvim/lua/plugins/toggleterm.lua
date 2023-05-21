return {
	"akinsho/toggleterm.nvim",
	version = '*',
	config = function()
		require("toggleterm").setup {
			hide_numbers = false,
			float_opts = {
				border = 'curved'
			},
		}
	end,
}
