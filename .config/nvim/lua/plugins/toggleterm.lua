return {
	"akinsho/toggleterm.nvim",
	version = '*',
	config = function()
		require("toggleterm").setup {
			hide_numbers = true,
			float_opts = {
				border = 'curved'
			},
		}
	end,
}
