return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		vim.cmd.colorscheme "catppuccin"
		require("catppuccin").setup({
			flavour = "Mocha"
		})
	end
}
