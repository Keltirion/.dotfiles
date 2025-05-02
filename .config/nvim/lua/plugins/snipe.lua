return {
	"leath-dub/snipe.nvim",
	opts = {},
	config = function()
		require("snipe").setup {
			ui = {
				open_win_override = {
					title = "Buffers",
					border = "rounded", -- use "rounded" for rounded border
				},
			},
			navigate = {
				open_split = "V",
				open_vsplit = "X",
			},
		}
	end
}
