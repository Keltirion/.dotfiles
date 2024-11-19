return {
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300

		require("which-key").setup {
			win = {
				border = "single",
			},
			layout = {
				spacing = 4,
				align = "center",
			}
		}

		local wk = require("which-key")

		wk.add({
			-- Main page
			{ "<leader>w",  "<cmd>w<cr>",                                                                             desc = "Save file" },
			{ "<leader>Q",  "<cmd>qa<cr>",                                                                            desc = "Close entire neovim" },
			{ "<leader>q",  "<cmd>bd<cr>",                                                                            desc = "Close current buffer" },
			{ "<leader>s",  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],                                   desc = "Edit all occurences of word" },
			{ "<leader>P",  [["+p]],                                                                                  desc = "Paste from system clipboard", mode = { "n", "v" } },
			{ "<leader>p",  [["*p]],                                                                                  desc = "Paste from * clipboard",      mode = { "n", "v" } },
			---- Visual mode
			{ "<leader>y",  [["+y]],                                                                                  desc = "Copy to system clipboard",    mode = "v" },
			{ "<leader>Y",  [["+y]],                                                                                  desc = "Copy to * clipboard",         mode = "v" },

			-- Files
			{ "<leader>f",  group = "Files" },
			{ "<leader>ff", "<cmd>lua vim.lsp.buf.format { async = true }<CR>",                                       desc = "Format file",                 mode = "n" },
			{ "<leader>fs", function() require("telescope.builtin").find_files({ layout_strategy = 'vertical' }) end, desc = "Search for file in project",  mode = "n" },

			-- Buffers
			{ "<leader>b",  group = "Buffers" },
			{ "<leader>bn", "<cmd>bn<cr>",                                                                            desc = "Next buffer" },
			{ "<leader>bp", "<cmd>bp<cr>",                                                                            desc = "Previous buffer" },
			{ "<leader>bq", "<cmd>bd<cr>",                                                                            desc = "Close buffer" },
			{ "<leader>bl", "<cmd>Telescope buffers<cr>",                                                             desc = "List buffers" },
			{ "<leader>bs", function () require("snipe").open_buffer_menu() end,                                                    desc = "List buffers" },

			-- Diagnostics
			{ "<leader>d",  group = "Diagnostics", },
			{ "<leader>d]", vim.diagnostic.goto_next,                                                                 desc = "Next diagnostic" },
			{ "<leader>d[", vim.diagnostic.goto_next,                                                                 desc = "Previous diagnostic" },
			{ "<leader>ds", vim.diagnostic.open_float,                                                                desc = "Show diagnostic" },

			-- Explorer
			{ "<leader>e",  group = "Explorer" },
			{ "<leader>ee", "<cmd>lua MiniFiles.open()<cr>",                                                          desc = "Explore files" },
			{ "<leader>es", "<cmd>Neotree<cr>",                                                                       desc = "Show/hide filetree" },
			{ "<leader>et", "<cmd>Neotree focus<cr>",                                                                 desc = "Show/focus filetree" },
			{ "<leader>eq", "<cmd>Neotree close<cr>",                                                                 desc = "Close explorer" },
			{ "<leader>ew", "<cmd>lua MiniFiles.synchronise()<cr>",                                                   desc = "Write changes" },
			{
				"<leader>ef",
				function()
					require('telescope.builtin').find_files({
						layout_strategy = 'vertical',
						find_command = { 'rg', '--files', '--hidden', '-g', '!.git' }
					})
				end,
				desc = "Find files"
			},

			-- Tabs
			{ "<leadeer>t", name = "Tab" },
			{ "<leader>tq", "<cmd>tabclose<cr>",                                      desc = "Close tab" },
			{ "<leader>ta", "<cmd>tabnew<cr>",                                        desc = "New tab" },
			{ "<leader>tl", "<cmd>tabNext<cr>",                                       desc = "Next tab" },
			{ "<leader>th", "<cmd>tabprevious<cr>",                                   desc = "Previous tab" },

			-- Harpoon
			-- { "<leader>h",  group = "Harpoon" },
			-- { "<leader>h1", function() require("harpoon.ui").nav_file(1) end,         desc = "Swap to first mark" },
			-- { "<leader>h2", function() require("harpoon.ui").nav_file(2) end,         desc = "Swap to second mark" },
			-- { "<leader>h3", function() require("harpoon.ui").nav_file(3) end,         desc = "Swap to second mark" },
			-- { "<leader>h4", function() require("harpoon.ui").nav_file(4) end,         desc = "Swap to second mark" },
			-- { "<leader>hh", function() require("harpoon.mark").add_file() end,        desc = "Mark file" },
			-- { "<leader>u4", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Show ui" },

			-- Git
			{ "<leader>g",  group = "Git" },
			{ "<leader>gl", "<cmd>LazyGitCurrentFile<cr>",                            desc = "Start lazygit" },
			{ "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>",            desc = "Toggle line blame" },
			{ "<leader>gv", "<cmd>Gitsigns select_hunk<cr>",                          desc = "Select hunk" },
			{ "<leader>gd", "<cmd>Gitsigns toggle_deleted<cr>",                       desc = "Show deleted" },
			{ "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",                           desc = "Reset hunk" },
			{ "<leader>g]", "<cmd>Gitsigns next_hunk<cr>",                            desc = "Next git hunk" },
			{ "<leader>g[", "<cmd>Gitsigns prev_hunk<cr>",                            desc = "Previous git hunk" },

			-- Config
			{ "<leader>c",  group = "Config" },
			{ "<leader>c",  "<cmd>PackerSync<cr>",                                    desc = "Packer sync" }
		})
	end
}

-- Project
-- wk.register({
-- 	p = {
-- 		name = "Project",
-- 		s = {
-- 			function()
-- 				require 'telescope'.extensions.project.project { layout_strategy = 'vertical', display_type = 'full', order_by = 'recent' }
-- 			end,
-- 			"Show projects" },
-- 		r = { "<cmd>Telescope projects<cr>", "Show recent projects" },
-- 		y = { "<cmd>Telescope yaml_schema<cr>", "Change yaml schema" },
-- 	},
-- }, { prefix = "<leader>" })
