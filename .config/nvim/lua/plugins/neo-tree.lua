return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		"s1n7ax/nvim-window-picker",
	},
	config = function()
		vim.fn.sign_define("DiagnosticSignError",
			{ text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn",
			{ text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo",
			{ text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint",
			{ text = "󰌵", texthl = "DiagnosticSignHint" })

		require("neo-tree").setup({
			close_if_last_window = false,
			hide_root_node = true,
			git_status_async = false,

			source_selector = {
				winbar = false,
				statusline = false,
				-- sources = {
				-- 	{ source = "filesystem", display_name = " 󰉓 File " },
				-- 	{ source = "git_status", display_name = " 󰊢 Git " },
				-- 	{ source = "buffers", display_name = " 󰓩 Buf " },
				-- 	{ source = "document_symbols", display_name = "  Sym " },
				-- }
			},

			window = {
				mappings = {
					["<space>"] = "none",
					["i"] = "none",
					["s"] = "none",
					["x"] = "open_split",
					["v"] = "open_vsplit",
					["c"] = "cut_to_clipboard"
				}
			},

			filesystem = {
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						".DS_Store",
						"thumbs.db",
					},
					never_show = {
						".terragrunt-cache",
						".DS_Store",
						".git",
					}
				},
				fuzzy_finder_mappings = {
					["<C-j>"] = "move_cursor_down",
					["<C-k>"] = "move_cursor_up",
				},
			}

		})
	end
}
