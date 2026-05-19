return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("mason").setup({ ui = { border = "rounded" } })

			-- Configuração visual dos diagnósticos
			local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋽 " }

			vim.diagnostic.config({
				virtual_text = {
					prefix = "●", -- Prefixo do texto virtual
					source = "if_many", -- Mostra a fonte se houver mais de um diagnóstico
					spacing = 4,
				},
				float = {
					border = "rounded",
					source = "always", -- Sempre mostra a fonte na janela flutuante
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = signs.Error,
						[vim.diagnostic.severity.WARN] = signs.Warn,
						[vim.diagnostic.severity.HINT] = signs.Hint,
						[vim.diagnostic.severity.INFO] = signs.Info,
					},
				},
				underline = true,
				update_in_insert = false, -- Não polui enquanto você digita
				severity_sort = true,
			})

			-- Apenas NOMES de servidores LSP (para o mason-lspconfig)
			local servers = {
				"lua_ls",
				"html",
				"cssls",
				"ts_ls",
				"rust_analyzer",
				"pyright",
				"bashls",
				"yamlls",
				"taplo",
			}

			-- Todas as ferramentas (LSPs + Formatters + Linters) para o mason-tool-installer
			local all_tools = {
				"lua_ls",
				"html",
				"cssls",
				"ts_ls",
				"rust_analyzer",
				"pyright",
				"bashls",
				"yamlls",
				"taplo",
				"stylua",
				"prettier",
				"black",
				"ruff",
				"shfmt",
				"shellcheck",
				"eslint_d",
				"rustfmt",
			}

			-- Configura o mason-lspconfig apenas com LSPs
			require("mason-lspconfig").setup({ ensure_installed = servers })

			-- Configura o instalador geral para garantir que TUDO esteja instalado
			require("mason-tool-installer").setup({ ensure_installed = all_tools })

			-- Atalhos de teclado
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local opts = { buffer = args.buf, silent = true }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

					-- Atalho para ligar/desligar inlay hints
					vim.keymap.set("n", "<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }), { bufnr = args.buf })
					end, { buffer = args.buf, desc = "Toggle Inlay Hints" })

					-- Ativa inlay hints se o servidor suportar
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client.server_capabilities.inlayHintProvider then
						vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
					end
				end,
			})

			-- Ativa os servidores
			for _, server in ipairs(servers) do
				local config = { capabilities = capabilities }
				if server == "lua_ls" then
					config.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
				end
				if server == "rust_analyzer" then
					config.settings = {
						["rust-analyzer"] = {
							check = {
								command = "clippy",
							},
							inlayHints = {
								bindingModeHints = { enable = true },
								chainingHints = { enable = true },
								closingBraceHints = { enable = true, minLines = 25 },
								closureReturnTypeHints = { enable = "always" },
								lifetimeElisionHints = { enable = "always", useParameterNames = true },
								parameterHints = { enable = true },
								reborrowHints = { enable = "always" },
								renderColons = true,
								typeHints = {
									enable = true,
									hideNamedTempTypes = false,
									hideClosureInitialization = false,
								},
							},
						},
					}
				end
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
	},
}
