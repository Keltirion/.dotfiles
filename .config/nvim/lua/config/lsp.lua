local api = vim.api
local lsp = vim.lsp

-- 1. General Configuration
-- Diagnostics
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

-- Handlers
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, { border = "rounded" })
lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, { border = "rounded" })
lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
	signs = true,
	underline = true,
	virtual_text = {
		spacing = 5,
		min = vim.diagnostic.severity.HINT,
	},
	update_in_insert = true,
})

-- 2. Capabilities & Attach
local capabilities = lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, "blink.cmp")

if ok then
	capabilities = vim.tbl_deep_extend("force", capabilities, blink.get_lsp_capabilities())
end

local on_attach = function(client, bufnr)
	local function nmap(keys, func, desc)
		if desc then desc = "LSP: " .. desc end
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
		api.nvim_buf_create_user_command(bufnr, "Fmt", function(_)
			vim.lsp.buf.format({ async = true })
		end, { desc = "Format current buffer with LSP" })
	end
end

-- 3. Server Definitions
-- Note: Ensure binaries (cmd) are in your PATH (e.g., installed via Mason)
local servers = {
	lua_ls = {
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		root_markers = { ".luarc.json", ".luarc.jsonc", ".git", "lua" },
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
			},
		},
	},
	dockerls = {
		cmd = { "docker-langserver", "--stdio" },
		filetypes = { "dockerfile" },
		root_markers = { "Dockerfile", ".git" },
		settings = {
			docker = {
				filetypes = { "dockerfile", "containerfile" },
				root_markers = { "Dockerfile", "Containerfile" },
			},
		},
	},
	docker_compose_language_service = {
		cmd = { "docker-compose-langserver", "--stdio" },
		filetypes = { "yaml.docker-compose", "yaml" },
		root_markers = { "docker-compose.yml", "docker-compose.yaml", ".git" },
	},
	jsonls = {
		cmd = { "vscode-json-language-server", "--stdio" },
		filetypes = { "json", "jsonc" },
		root_markers = { ".git", "package.json" },
	},
	helm_ls = {
		cmd = { "helm_ls", "serve" },
		filetypes = { "helm" },
		root_markers = { "Chart.yaml" },
		settings = {
			['helm-ls'] = {
				valuesFiles = {
					mainValuesFile = "**/values.yaml",
					lintOverlayValuesFile = "**/values.lint.yaml",
					additionalValuesFilesGlobPattern = "**/*values*.yaml"
				},
				yamlls = {
					filetype_exclude = { "helm" },
					config = {
						hover = true,
						validation = { enabled = false },
						schemas = {},
					}
				}
			}
		}
	},
	gopls = {
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork" },
		root_markers = { "go.work", "go.mod", ".git" },
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				analyses = { unusedparams = true },
			}
		}
	},
	pyright = {
		cmd = { "pyright-langserver", "--stdio" },
		filetypes = { "python" },
		root_markers = { "pyproject.toml", "setup.py", ".git" },
		settings = {
			python = {
				venvPath = ".",
				venv = ".venv",
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					useLibraryCodeForTypes = true,
					typeCheckingMode = "basic",
				}
			}
		}
	},
	ansiblels = {
		cmd = { "ansible-language-server", "--stdio" },
		filetypes = { "yaml.ansible" },
		root_markers = { "ansible.cfg", ".ansible-lint" },
		settings = {
			ansible = {
				ansible = { path = ".venv/bin/ansible" },
				python = { interpreterPath = ".venv/bin/python3", python = ".venv/bin/python3" },
				validation = { enabled = true, lint = { path = ".venv/bin/ansible-lint", enabled = true } }
			}
		}
	},
	yamlls = {
		cmd = { "yaml-language-server", "--stdio" },
		filetypes = { "yaml", "yaml.docker-compose" },
		root_markers = { ".git" },
		settings = {
			yaml = {
				validate = true,
				format = { enable = true },
				schemaStore = { enable = true },
				schemas = {
					["https://raw.githubusercontent.com/canonical/cloud-init/main/cloudinit/config/schemas/versions.schema.cloud-config.json"] = "**/*cloud-init*",
					["https://json.schemastore.org/chart.json"] = "**/Chart.y*l",
					["https://json.schemastore.org/chart-lock.json"] = "**/Chart.lock",
					["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
						"**/azure-pipeline*.y*l",
						"*azure-pipeline*.y*l",
					},
				},
			},
		}
	},
	terraformls = {
		cmd = { "terraform-ls", "serve" },
		filetypes = { "terraform", "terraform-vars", "tf", "hcl" },
		root_markers = { ".terraform", ".git" },
	},
}

-- 4. Auto-start
local lsp_group = api.nvim_create_augroup("NativeLSP", { clear = true })

for name, config in pairs(servers) do
	api.nvim_create_autocmd("FileType", {
		group = lsp_group,
		pattern = config.filetypes,
		callback = function(ev)
			local root = vim.fs.root(ev.buf, config.root_markers)
			local root_dir = root or vim.uv.cwd()
			
			vim.lsp.start({
				name = name,
				cmd = config.cmd,
				root_dir = root_dir,
				settings = config.settings,
				capabilities = capabilities,
				on_attach = on_attach,
				init_options = config.init_options,
			})
		end,
	})
end
