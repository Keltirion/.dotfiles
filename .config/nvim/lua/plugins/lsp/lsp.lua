return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig_defaults = require("lspconfig").util.default_config

		lspconfig_defaults.capabilities = vim.tbl_deep_extend(
			"force",
			lspconfig_defaults.capabilities,
			require("blink.cmp").get_lsp_capabilities()
		)

		local on_attach = function(client, bufnr)
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end
				vim.keymap.set("n", keys, func, { buffer = bufnr, noremap = true, silent = true, desc = desc })
			end

			nmap("K", vim.lsp.buf.hover, "Open hover")
			nmap("<leader>dr", vim.lsp.buf.rename, "Rename")
			nmap("<leader>dr", vim.lsp.buf.references, "References")
			nmap("<leader>ca", vim.lsp.buf.code_action, "Code action")
			nmap("<leader>df", vim.lsp.buf.definition, "Goto definition")
			nmap("<leader>ds", "<cmd>vs | lua vim.lsp.buf.definition()<cr>", "Goto definition (v-split)")
			nmap("<leader>dh", "<cmd>sp | lua vim.lsp.buf.definition()<cr>", "Goto definition (h-split)")

			nmap("dn", vim.diagnostic.goto_next, "Goto next diagnostic")
			nmap("dN", vim.diagnostic.goto_prev, "Goto prev diagnostic")
			nmap("<leader>dq", vim.diagnostic.setloclist, "Open diagnostics list")
			nmap("<leader>de", vim.diagnostic.open_float, "Open diagnostic float")

			vim.keymap.set("i", "<M-t>", vim.lsp.buf.signature_help, { buffer = bufnr })

			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_buf_create_user_command(bufnr, "Fmt", function(_)
					vim.lsp.buf.format({ async = true })
				end, { desc = "Format current buffer with LSP" })
			end
		end

		vim.diagnostic.config({
			virtual_text = true,
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
		})

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			signs = true,
			underline = true,
			virtual_text = {
				spacing = 5,
				min = vim.diagnostic.severity.HINT,
			},
			update_in_insert = true,
		})

		require("lspconfig").lua_ls.setup {}
		require("lspconfig").dockerls.setup {}
		require("lspconfig").docker_compose_language_service.setup {}
		require("lspconfig").jsonls.setup {}
		require("lspconfig").helm_ls.setup({
			on_attach = on_attach,
			settings = {
				['helm-ls'] = {
					valuesFiles = {
						mainValuesFile = "**/values.yaml",
						lintOverlayValuesFile = "**/values.lint.yaml",
						additionalValuesFilesGlobPattern = "**/*values*.yaml"
					},
					yamlls = {
						filetype_exclude = {
							"helm"
						},
						config = {
							hover = true,
							validation = {
								enabled = false
							},
							schemas = {
							},
						}
					}
				}
			}
		})
		require("lspconfig").gopls.setup({
			on_attach = on_attach,
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
					}
				}
			}
		})
		require("lspconfig").ansiblels.setup {
			settings = {
				ansible = {
					ansible = {
						path = ".ansible-venv/bin/ansible",
					},
					python = {
						interpreterPath = ".ansible-venv/bin/python3",
						python = ".ansible-venv/bin/python3",
					},
					validation = {
						enabled = true,
						lint = {
							path = ".ansible-venv/bin/ansible-lint",
							enabled = true,
						}
					}
				}
			}
		}
		require("lspconfig").yamlls.setup {
			settings = {
				yaml = {
					validate = true,
					format = {
						enable = true
					},
					schemaStore = {
						enable = true
					},
					schemas = {
						["https://raw.githubusercontent.com/canonical/cloud-init/main/cloudinit/config/schemas/versions.schema.cloud-config.json"] = "**/*cloud-init*",
						["https://json.schemastore.org/chart.json"] = "**/Chart.y*l",
						["https://json.schemastore.org/chart-lock.json"] = "**/Chart.lock",
					},
				},
			}
		}
		require("lspconfig").terraformls.setup({
			on_attach = on_attach,
			filetypes = {
				"terraform",
				"terraform-vars",
				"tf",
				"hcl"
			}
		})
		require("lspconfig").lua_ls.setup({
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})
		require("lspconfig").azure_pipelines_ls.setup({
			on_attach = on_attach,
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
	end
}
