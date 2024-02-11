return {
	"folke/noice.nvim",

	dependencies = {
		'MunifTanjim/nui.nvim',
		'rcarriga/nvim-notify'
	},

	config = function()
		require("noice").setup({
			-- add any options here
			-- routes = {
			-- 	{
			-- 		filter = {
			-- 			event = 'msg_show',
			-- 			kind = '',
			-- 			find = 'more line',
			-- 		},
			-- 		opts = { skip = true },
			-- 	}
			-- }
		})
	end

}
