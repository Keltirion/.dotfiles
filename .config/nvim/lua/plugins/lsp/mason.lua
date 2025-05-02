return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded"
				}
			})
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"vimls",
					"bashls",
					"yamlls",
					"helm_ls",
					"jsonls",
					"lua_ls",
					"ansiblels",
					"terraformls",
					"gopls",
					"dockerls",
					"docker_compose_language_service",
					"azure_pipelines_ls",
				}
			})
		end
	},
}
