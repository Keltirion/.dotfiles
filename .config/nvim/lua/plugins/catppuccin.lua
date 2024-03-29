return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			transparent_background = true,
			integrations = {
				mason = true,
				which_key = true
			}
		})
		vim.cmd.colorscheme "catppuccin"
	end,
}
