return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		lazy = true,
		config = function()
			require('lsp-zero.settings').preset({})
		end
	},

	-- CMP Autocompletion
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			{ 'L3MON4D3/LuaSnip' },
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			-- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
			-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

			require('lsp-zero.cmp').extend()

			-- And you can configure cmp even more, if you want to.
			local cmp = require('cmp')
			local cmp_action = require('lsp-zero.cmp').action()

			cmp.setup({
				sources = cmp.config.sources({
						{ name = 'nvim_lsp', keyword_length = 1 },
						{ name = 'luasnip',  keyword_length = 2 },
					},
					{
						{ name = 'path' },
						{ name = 'buffer', keyword_length = 3 },
					}),

				formatting = {
					fields = { 'kind', 'abbr', 'menu' }
				},

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				mapping = cmp.mapping.preset.insert({
					['<C-u>'] = cmp.mapping.scroll_docs(-4),
					['<C-d>'] = cmp.mapping.scroll_docs(4),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),

					['<Tab>'] = cmp.mapping(function(fallback)
						local col = vim.fn.col('.') - 1

						if cmp.visible() then
							cmp.select_next_item(select_opts)
						elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
							fallback()
						else
							cmp.complete()
						end
					end, { 'i', 's' }),
				}),
				['<S-Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item(select_opts)
					else
						fallback()
					end
				end, { 'i', 's' }),
			})
		end
	},

	-- LSP
	{
		'neovim/nvim-lspconfig',
		cmd = 'LspInfo',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
		},
		config = function()
			-- This is where all the LSP shenanigans will live
			local lsp = require('lsp-zero')

			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
			end)

			lsp.ensure_installed({
				'bashls',
				'yamlls',
				'vimls',
				'jsonls',
				'lua_ls',
				'terraformls',
				'tflint',
				'powershell_es',
				'gopls',
				'golangci_lint_ls',
				'dockerls'
			})

			require('lspconfig').bashls.setup {}
			require('lspconfig').dockerls.setup {}
			require('lspconfig').gopls.setup {}
			require('lspconfig').golangci_lint_ls.setup {}
			require('lspconfig').powershell_es.setup {}
			require('lspconfig').tflint.setup {}
			require('lspconfig').terraformls.setup{}
			require('lspconfig').lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { 'vim' },
						},
					},
				},
			})
			require('lspconfig').azure_pipelines_ls.setup({
				cmd = { 'node',
					'/Users/lech/.local/bin/azure-pipeline-language-server/node_modules/azure-pipelines-language-server/out/server.js',
					'--stdio' },
				settings = {
					yaml = {
						schemas = {
							["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
								"/azure-pipeline*.y*l",
								"/*.azure*",
								"/*.ado.*",
								"Azure-Pipelines/**/*.y*l",
							},
						},
					},
				},
			})
			lsp.setup()
		end
	}
}
