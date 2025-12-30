return {
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300

		local wk = require("which-key")
		local git = require("gitsigns")
		local dap = require("dap")
		local custom_terminals = require("terminals")
		
		local snacks = require("snacks")

		local hydra = function(keys)
			require("which-key").show({
				keys = keys,
				loop = true,
			})
		end

		local rename_tab = function()
			local user_input = vim.fn.input("Insert tab name: ")

			if user_input ~= "" then
				vim.cmd("LualineRenameTab " .. user_input)
				vim.notify("Tab renamed to " .. user_input, vim.log.levels.INFO)
			else
				vim.notify("Tab name cannot be empty", vim.log.levels.WARN)
			end
		end

		wk.setup {
			win = {
				title = "",
				border = "rounded",
			},
			layout = {
				spacing = 2,
				align = "center",
			},
		}

		wk.add({
			-- Main page
			{ "<leader>w",  "<cmd>w<cr>",                                                                             desc = "Save file" },
			{ "<leader>Q",  "<cmd>qa<cr>",                                                                            desc = "Close entire neovim" },
			{ "<leader>q",  "<cmd>bd<cr>",                                                                            desc = "Close current buffer" },
			{ "<leader>c",  "<cmd>close<cr>",                                                                         desc = "Close current window" },
			{ "<leader>P",  [["+p]],                                                                                  desc = "Paste from system clipboard",          mode = { "n", "v" } },
			---- Visual mode
			{ "<leader>y",  [["+y]],                                                                                  desc = "Copy to system clipboard",             mode = "v" },
			{ "<leader>Y",  [["+y]],                                                                                  desc = "Copy to * clipboard",                  mode = "v" },

			-- Regex
			{ "<leader>r",  group = "Regex" },
			{ "<leader>rf", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],                                   desc = "Edit all occurences of word in buffer" },
			{ "<leader>rF", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],                                    desc = "Edit all occurences of word in line" },

			-- Search
			{ "<leader>s",  group = "Search" },
			{ "<leader>sg", function() require("telescope.builtin").live_grep({ search_dirs = { '.' } }) end,         desc = "Search for word in neovim root",       mode = "n" },

			-- Files
			{ "<leader>f",  group = "Files" },
			{ "<leader>ff", "<cmd>lua vim.lsp.buf.format { async = true }<CR>",                                       desc = "Format file",                          mode = "n" },
			{ "<leader>fs", function() require("telescope.builtin").find_files({ layout_strategy = 'vertical' }) end, desc = "Search for file in project",           mode = "n" },

			-- AI
			{ "<leader>a",  group = "AI" },
			{ "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>",                                                      desc = "Chat with AI",                         mode = "n" },

			-- Buffers
			{ "<leader>b",  group = "Buffers" },
			{ "<leader>bn", "<cmd>bn<cr>",                                                                            desc = "Next buffer" },
			{ "<leader>bp", "<cmd>bp<cr>",                                                                            desc = "Previous buffer" },
			{ "<leader>bq", "<cmd>bd<cr>",                                                                            desc = "Close buffer" },
			{ "<leader>bl", "<cmd>Telescope buffers<cr>",                                                             desc = "List buffers" },
			{ "<leader>bs", function() require("snipe").open_buffer_menu() end,                                       desc = "List buffers" },

			-- Explorer
			{ "<leader>e",  group = "Explorer" },
			{ "<leader>eq", 
				function() 
					local picker = Snacks.picker.get({ source = "explorer" })[1]

					if picker then
						picker:close()
					end
				end,                                                                 desc = "Close explorer" },
			{ "<leader>et", 
				function()
					local picker = Snacks.picker.get({ source = "explorer" })[1]

					if picker then
						picker:focus()
					else
						Snacks.explorer()
					end
				end, 
				desc = "Focus/Open Explorer" 
			},
			-- { "<leader>er", 
			-- 	function()
			-- 		Snacks.explorer.reveal()
			-- 	end,
			-- 	desc = "Reveal current file in Explorer"
			-- },
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
			{ "<leader>T",   group = "Tab" },
			{ "<leader>Tq",  "<cmd>tabclose<cr>",                                 desc = "Close tab" },
			{ "<leader>Ta",  "<cmd>tabnew<cr>",                                   desc = "New tab" },
			{ "<leader>Tl",  "<cmd>tabNext<cr>",                                  desc = "Next tab" },
			{ "<leader>Th",  "<cmd>tabprevious<cr>",                              desc = "Previous tab" },
			{ "<leader>Tr",  function() rename_tab() end,                         desc = "Rename tab" },
			{ "<leader>1",   "<cmd>tabnext 1<cr>",                                desc = "Switch to tab 1",    hidden = true },
			{ "<leader>2",   "<cmd>tabnext 2<cr>",                                desc = "Switch to tab 2",    hidden = true },
			{ "<leader>3",   "<cmd>tabnext 3<cr>",                                desc = "Switch to tab 3",    hidden = true },
			{ "<leader>4",   "<cmd>tabnext 4<cr>",                                desc = "Switch to tab 4",    hidden = true },
			{ "<leader>5",   "<cmd>tabnext 5<cr>",                                desc = "Switch to tab 5",    hidden = true },

			-- Terminal
			{ "<leader>t",   group = "Terminal" },
			{ "<leader>tt",  "<cmd>ToggleTerm direction=float<cr>",               desc = "Open last terminal" },
			{ "<leader>tb",  "<cmd>ToggleTerm direction=horizontal size=100<cr>", desc = "Open last terminal" },
			{ "<leader>t1",  "<cmd>v:count1 . 'ToggleTerm'<cr>",                  desc = "Open Terminal 1" },
			{ "<leader>t2",  "<cmd>v:count2 . 'ToggleTerm'<cr>",                  desc = "Open Terminal 2" },
			{ "<leader>tl",  function() custom_terminals.lazygit() end,           desc = "Toggle lazygit" },

			-- Go To
			{ "<leader>g",   group = "Go to" },
			-- Git
			{ "<leader>gg",  group = "Git" },
			{ "<leader>ggh", function() hydra("<leader>gg") end,                  desc = "Enable hydra mode" },
			{ "<leader>ggb", "<cmd>Gitsigns toggle_current_line_blame<cr>",       desc = "Toggle line blame" },
			{ "<leader>ggb", function() git.toggle_current_line_blame() end,      desc = "Toggle line blame" },
			{ "<leader>ggv", "<cmd>Gitsigns select_hunk<cr>",                     desc = "Select hunk" },
			{ "<leader>ggd", "<cmd>Gitsigns toggle_deleted<cr>",                  desc = "Show deleted" },
			{ "<leader>ggr", "<cmd>Gitsigns reset_hunk<cr>",                      desc = "Reset hunk" },
			{ "<leader>gg]", function() git.next_hunk() end,                      desc = "Next git hunk", },
			{ "<leader>gg[", function() git.prev_hunk() end,                      desc = "Previous git hunk", },
			-- Diagnostics
			{ "<leader>gd",  group = "Diagnostics", },
			{ "<leader>gh",  function() hydra("<leader>gd") end,                  desc = "Enable hydra mode" },
			{ "<leader>gd]", vim.diagnostic.goto_next,                            desc = "Next diagnostic" },
			{ "<leader>gd[", vim.diagnostic.goto_next,                            desc = "Previous diagnostic" },
			{ "<leader>gds", vim.diagnostic.open_float,                           desc = "Show diagnostic" },
			-- Debugger
			{ "<leader>gb",  group = "Debugger" },
			{ "<leader>gbh", function() hydra("<leader>gb") end,                  desc = "Enable hydra mode" },
			{ "<leader>gbb", function() dap.toggle_breakpoint() end,              desc = "Toggle breakpoint" },
			{ "<leader>gbc", function() dap.continue() end,                       desc = "Continue" },
			{ "<leader>gbn", function() dap.step_over() end,                      desc = "Step over" },
			{ "<leader>gbi", function() dap.step_into() end,                      desc = "Step into" },
			{ "<leader>gbo", function() dap.step_out() end,                       desc = "Step out" },
		})
	end
}
