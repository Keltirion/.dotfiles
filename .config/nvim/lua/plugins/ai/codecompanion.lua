return {
	"olimorris/codecompanion.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require('codecompanion').setup({
			strategies = {
				chat = {
					adapter = "gemini",
					model = "gemini-2.5-pro",
				},
				inline = {
					adapter = "gemini",
					model = "gemini-2.5-flash-Lite",
				},
				cmd = {
					adapter = "gemini",
					model = "gemini-2.5-pro",
				}
			},
			adapters = {
				gemini = function()
					return require("codecompanion.adapters").extend("gemini", {
						env = {
							api_key = "cmd:opsearch -n 'Gemini API Key'",
						}
					})
				end,
			},
			display = {
				chat = {
					window = {
						layout = "float"
					}
				}
			}
		})
	end
}
