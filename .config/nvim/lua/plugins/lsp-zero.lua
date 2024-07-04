return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',

	dependencies = {
		-- LSP Support
		{ 'neovim/nvim-lspconfig' },
		{
			'williamboman/mason.nvim',
			build = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{ 'williamboman/mason-lspconfig.nvim' },
		-- Autocompletion
		{ 'hrsh7th/nvim-cmp' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'L3MON4D3/LuaSnip' },
		{ 'rafamadriz/friendly-snippets' },
		{ 'saadparwaiz1/cmp_luasnip' },
		-- Formating
		{ 'lukas-reineke/lsp-format.nvim' }
	},

	config = function()
		-- LSP
		local lsp = require('lsp-zero')

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
			'ansiblels',
			'bashls',
			'yamlls',
			'vimls',
			'jsonls',
			'lua_ls',
			'terraformls',
			'gopls',
			'dockerls',
			'docker_compose_language_service',
			'azure_pipelines_ls',
			'rnix',
		})

		-- Formatter
		require("lsp-format").setup {}

		-- Servers
		require('lspconfig').lua_ls.setup {}
		require('lspconfig').rnix.setup {}
		require('lspconfig').dockerls.setup {}
		require('lspconfig').docker_compose_language_service.setup {}

		require('lspconfig').ansiblels.setup {
			settings = {
				ansible = {
					validation = {
						enabled = false,
						lint = {
							enabled = false
						}
					}
				}
			}
		}

		require('lspconfig').yamlls.setup {
			filetypes = {
				'yaml',
				'yml',
				'cloud-init'
			},
			settings = {
				yaml = {
					keyOrdering = false,
					schemaStore = {
						enable = true
					},
					schemas = {
						["https://json.schemastore.org/kustomization.json"] = "/k8s/*.y*l",
						["https://raw.githubusercontent.com/canonical/cloud-init/main/cloudinit/config/schemas/versions.schema.cloud-config.json"] = "*cloud-init*",
					},
				},
			}
		}

		require('lspconfig').gopls.setup {
			on_attach = require("lsp-format").on_attach,
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
					analyses = {
						assign = true,
						atomic = true,
						bools = true,
						composites = true,
						copylocks = true,
						deepequalerrors = true,
						embed = true,
						errorsas = true,
						fieldalignment = true,
						httpresponse = true,
						ifaceassert = true,
						loopclosure = true,
						lostcancel = true,
						nilfunc = true,
						nilness = true,
						nonewvars = true,
						printf = true,
						shadow = true,
						shift = true,
						simplifycompositelit = true,
						simplifyrange = true,
						simplifyslice = true,
						sortslice = true,
						stdmethods = true,
						stringintconv = true,
						structtag = true,
						testinggoroutine = true,
						tests = true,
						timeformat = true,
						unmarshal = true,
						unreachable = true,
						unsafeptr = true,
						unusedparams = true,
						unusedresult = true,
						unusedvariable = true,
						unusedwrite = true,
						useany = true,
					},
					hoverKind = "FullDocumentation",
					linkTarget = "pkg.go.dev",
					usePlaceholders = true,
					vulncheck = "Imports",
				}
			},
		}

		-- require('lspconfig').tflint.setup {
		-- 	filetypes = {
		-- 		"terraform",
		-- 		"terraform-vars",
		-- 		"tf",
		-- 		"hcl"
		-- 	}
		-- }

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
			filetypes = {
				"yaml.azure-pipelines"
			},
			settings = {
				yaml = {
					schemas = {
						["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
							"*/azure-pipeline*.y*l",
							"*/*pipeline*/*",
						},
					},
				},
			},
		})

		lsp.setup()

		-- Mason
		require('mason').setup({})
		require('mason-lspconfig').setup({
			ensure_installed = {
				'ansiblels',
				'bashls',
				'yamlls',
				'vimls',
				'jsonls',
				'lua_ls',
				'terraformls',
				'gopls',
				'dockerls',
				'docker_compose_language_service',
				'azure_pipelines_ls',
				'rnix',
			}
		})

		-- CMP
		require('lsp-zero').extend_cmp()
		require('luasnip.loaders.from_vscode').lazy_load()

		-- local luasnip = require('luasnip')
		local cmp = require('cmp')

		-- local has_words_before = function()
		-- 	unpack = unpack or table.unpack
		-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		-- end

		cmp.setup({
			sources = {
				{ name = 'path' },
				{ name = 'nvim_lsp' },
				{ name = 'luasnip', keyword_length = 2 },
				{ name = 'buffer',  keyword_length = 3 },
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = {
				-- `Enter` key to confirm completion
				['<CR>'] = cmp.mapping.confirm({ select = false }),

				-- Ctrl+Space to trigger completion menu
				['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),

				-- -- Super 'Tab'
				-- ["<Tab>"] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		cmp.select_next_item()
				-- 		-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
				-- 		-- they way you will only jump inside the snippet region
				-- 	elseif luasnip.expand_or_jumpable() then
				-- 		luasnip.expand_or_jump()
				-- 	elseif has_words_before() then
				-- 		cmp.complete()
				-- 	else
				-- 		fallback()
				-- 	end
				-- end, { "i", "s" }),
				--
				-- ["<S-Tab>"] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		cmp.select_prev_item()
				-- 	elseif luasnip.jumpable(-1) then
				-- 		luasnip.jump(-1)
				-- 	else
				-- 		fallback()
				-- 	end
				-- end, { "i", "s" }),
			},
			formatting = lsp.cmp_format({ details = true })
		})
	end
}
