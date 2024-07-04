return {
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup {
			window = {
				border = "single",
				margin = { 0, 0, 0, 0 },
			},
			layout = {
				spacing = 4,
				align = "center",
			}
		}
		local wk = require("which-key")

		wk.register({
			f = {
				name = "File",
				f = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format file" },
				s = { function() require("telescope.builtin").find_files({ layout_strategy = 'vertical' }) end,
					"Search for file in project" },
			},
		}, { prefix = "<leader>" })

		-- Main page
		wk.register({
			w = { "<cmd>w<cr>", "Save file" },
			Q = { "<cmd>qa<cr>", "Close entire neovim" },
			q = { "<cmd>bd<cr>", "Close current buffer" },
			j = { "", "jump to word" },
			s = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Edit all occurences of word" },
			-- Pasting
			p = { [["+p]], "Paste from system clipboard" },
			P = { [["*p]], "Paste from * clipboard" },
		}, { prefix = "<leader>" })

		-- Main page visual
		wk.register({
			-- Yanking
			y = { [["+y]], "Copy to system clipboard" },
			Y = { [["+y]], "Copy to * clipboard" },
		}, { prefix = "<leader>", mode = "v" })

		-- Diagnostics
		wk.register({
			d = {
				name = "Diagnostics",
				["]"] = { vim.diagnostic.goto_next, "Next diagnostic" },
				["["] = { vim.diagnostic.goto_next, "Previous diagnostic" },
				s = { vim.diagnostic.open_float, "Show diagnostic" }
			}
		}, { prefix = "<leader>" })

		-- Harpoon
		wk.register({
			h = {
				name = "Harpoon",
				["1"] = { function() require("harpoon.ui").nav_file(1) end, "Swap to first mark" },
				["2"] = { function() require("harpoon.ui").nav_file(2) end, "Swap to second mark" },
				["3"] = { function() require("harpoon.ui").nav_file(3) end, "Swap to second mark" },
				["4"] = { function() require("harpoon.ui").nav_file(4) end, "Swap to second mark" },
				h = { function() require("harpoon.mark").add_file() end, "Mark file" },
				u = { function() require("harpoon.ui").toggle_quick_menu() end, "Show ui" },
			},
		}, { prefix = "<leader>" })

		-- Buffers
		wk.register({
			b = {
				name = "Buffers",
				n = { "<cmd>bn<cr>", "Next buffer" },
				p = { "<cmd>bp<cr>", "Previous buffer" },
				q = { "<cmd>bd<cr>", "Close buffer" },
				l = { "<cmd>Telescope buffers<cr>", "List buffers" },
			},
		}, { prefix = "<leader>" })

		-- Explorer
		wk.register({
			e = {
				name = "Explorer",
				e = { "<cmd>lua MiniFiles.open()<cr>", "Explore files" },
				s = { "<cmd>Neotree<cr>", "Show/hide filetree" },
				t = { "<cmd>Neotree focus<cr>", "Show/focus filetree" },
				q = { "<cmd>Neotree close<cr>", "Close explorer" },
				w = { "<cmd>lua MiniFiles.synchronise()<cr>", "Write changes" },
				f = {
					function()
						require('telescope.builtin').find_files({
							layout_strategy = 'vertical',
							find_command = { 'rg', '--files', '--hidden', '-g', '!.git' }
						})
					end, "Find files" },
			},
		}, { prefix = "<leader>" })

		-- Tab
		wk.register({
			t = {
				name = "Tab",
				q = { "<cmd>tabclose<cr>", "Close tab" },
				a = { "<cmd>tabnew<cr>", "New tab" },
				l = { "<cmd>tabNext<cr>", "Next tab" },
				h = { "<cmd>tabprevious<cr>", "Previous tab" },
				-- h = { "<cmd>ToggleTerm size=30 dir=git_dir direction=horizontal<cr>", "Start horizontal terminal" },
				-- t = { "<cmd>ToggleTerm dir=git_dir direction=float<cr>", "Start floating terminal" },
				-- q = { "<cmd>bd!<cr>", "Close terminal" },
				-- w = { "<cmd>q<cr>", "Hide terminal" },
			},
		}, { prefix = "<leader>" })

		-- Git
		wk.register({
			g = {
				name = "Git",
				l = { "<cmd>LazyGitCurrentFile<cr>", "Start lazygit" },
				b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle line blame" },
				v = { "<cmd>Gitsigns select_hunk<cr>", "Select hunk" },
				d = { "<cmd>Gitsigns toggle_deleted<cr>", "Show deleted" },
				r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
				["]"] = { "<cmd>Gitsigns next_hunk<cr>", "Next git hunk" },
				["["] = { "<cmd>Gitsigns prev_hunk<cr>", "Previous git hunk" },
			},
		}, { prefix = "<leader>" })

		-- Session
		wk.register({
			s = {
				name = "Session",
				s = {"<cmd>SearchSession<cr>", "Search seassion"}
			}
		}, { prefix = "<leader>" })

		-- Project
		wk.register({
			p = {
				name = "Project",
				s = {
					function()
						require 'telescope'.extensions.project.project { layout_strategy = 'vertical', display_type = 'full', order_by = 'recent' }
					end,
					"Show projects" },
				r = { "<cmd>Telescope projects<cr>", "Show recent projects" },
				y = { "<cmd>Telescope yaml_schema<cr>", "Change yaml schema" },
			},
		}, { prefix = "<leader>" })

		-- Config
		wk.register({
			c = {
				name = "Config",
				s = { "<cmd>PackerSync<cr>", "Packer sync" },
			},
		}, { prefix = "<leader>" })
	end
}
