local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
	'bashls',
	'yamlls',
	'vimls',
	'jsonls',
	'lua_ls',
	'terraformls',
	'tflint',
	'powershell_es',
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

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

require 'lspconfig'.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
		},
	},
})

require 'lspconfig'.powershell_es.setup {}

require 'lspconfig'.terraformls.setup {
	filetypes = {
		"terraform",
		"hcl"
	}
}

require 'lspconfig'.tflint.setup {}

lsp.setup()

-- Snippets
require("luasnip.loaders.from_vscode").lazy_load()
