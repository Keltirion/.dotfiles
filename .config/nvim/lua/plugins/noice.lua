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
			lsp = {
				override = {
					-- override the default lsp markdown formatter with Noice
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					-- override the lsp markdown formatter with Noice
					["vim.lsp.util.stylize_markdown"] = true,
					-- override cmp documentation with Noice (needs the other options to work)
					["cmp.entry.get_documentation"] = true,
				}
			},
			presets = {
				lsp_doc_border = true
			}
		})
	end
}
