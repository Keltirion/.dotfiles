return {
	'akinsho/toggleterm.nvim',
	tag = '*',
	config = function ()
		require('toggleterm').setup {
			shade_terminals = true,

			float_opts = {
				border = 'curved',
			}
		}
	end
}
