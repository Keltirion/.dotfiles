return {
	'akinsho/toggleterm.nvim',
	tag = 'v2.13.1',
	config = function ()
		require('toggleterm').setup {
			shade_terminals = true,

			float_opts = {
				border = 'curved',
			}
		}
	end
}
