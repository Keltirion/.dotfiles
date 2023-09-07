return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	dependencies = {
		-- LSP Support
		{ 'neovim/nvim-lspconfig' }, -- Required
		{
			-- Optional
			'williamboman/mason.nvim',
			build = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

		-- Autocompletion
		{ 'hrsh7th/nvim-cmp' },   -- Required
		{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
		{ 'L3MON4D3/LuaSnip' },   -- Required
		{ 'rafamadriz/friendly-snippets' },
		{ 'saadparwaiz1/cmp_luasnip' }
	},
	config = function()
		-- LSP
		local lsp = require('lsp-zero').preset({})
		lsp.on_attach(function(client, bufnr)
			lsp.default_keymaps({ buffer = bufnr })
		end)

		lsp.set_sign_icons({
			error = '✘',
			warn = '▲',
			hint = '⚑',
			info = '»',
		})

		-- LSP Servers
		lsp.setup_servers({
			'bashls',
			'yamlls',
			'vimls',
			'jsonls',
			'lua_ls',
			'terraformls',
			'tflint',
			'gopls',
			'golangci_lint_ls',
			'dockerls',
			'docker_compose_language_service',
			'azure-pipelines-ls'
		})

		-- Servers
		require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
		require('lspconfig').dockerls.setup {}
		require('lspconfig').docker_compose_language_service.setup {}

		require('lspconfig').yamlls.setup {
			filetypes = {
				"DOCKERFILE"
			},
			settings = {
				yaml = {
					keyOrdering = false,
					schemaStora = {
						enable = true
					},
					schemas = {
						["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "*azure*pipeline*.ya*l",
						["https://json.schemastore.org/dockerd.json"] = "DOCKERFILE",
						["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.ya*l"
					},
				},
			}
		}

		require('lspconfig').gopls.setup {
			settings = {
				gopls = {
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
				},
			},
		}

		require('lspconfig').tflint.setup {
			filetypes = {
				"terraform",
				"terraform-vars",
				"tf",
				"hcl"
			}
		}

		require('lspconfig').terraformls.setup({
			filetypes = {
				"terraform",
				"terraform-vars",
				"tf",
				"hcl"
			}
		})

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

		require("lspconfig").azure_pipelines_ls.setup({
			settings = {
				yaml = {
					schemas = {
						["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
							"/azure-pipeline*.y*l",
							"/*.azure*",
							"Azure-Pipelines/**/*.y*l",
							"Pipelines/*.y*l",
						},
					},
				},
			},
		})

		lsp.setup()

		-- CMP
		require('lsp-zero').extend_cmp()
		require('luasnip.loaders.from_vscode').lazy_load()
		local cmp = require('cmp')
		cmp.setup({
			sources = {
				{ name = 'luasnip' },
				{ name = 'nvim_lsp' },
				{ name = 'buffer' },
				{ name = 'path'}
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = {
				-- `Enter` key to confirm completion
				['<CR>'] = cmp.mapping.confirm({ select = false }),

				-- Ctrl+Space to trigger completion menu
				['<C-Space>'] = cmp.mapping.complete(),
			},
		})
	end
}
