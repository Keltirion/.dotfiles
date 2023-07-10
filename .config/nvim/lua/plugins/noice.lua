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
			--   {
			--     view = "notify",
			--     filter = { event = "msg_showmode" },
			--   },
			-- },
		})
	end
}
