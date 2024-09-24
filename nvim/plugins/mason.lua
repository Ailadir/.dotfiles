return {
	-- Mason

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			local mason_tool_installer = require("mason-tool-installer")

			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				ensure_installed = {
					"html",
					"cssls",
					-- "tsserver",
					"lua_ls",
					"emmet_ls",
					"vtsls",
				},
				automatic_installation = true,
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettierd", -- prettier formatter
					"stylua", -- lua formatter
					-- "eslint_d", -- js linter
					-- "jsonlint",
					"markdownlint",
					"htmlhint",
					"shellcheck",
				},
			})
		end,
	},
	--Typescript tools

	-- LSP

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
			{ "folke/lazydev.nvim", opts = {} },
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		opts = {
			---@type lspconfig.options
			servers = {
				jsonls = {
					settings = {
						json = {
							fomat = {
								enable = true,
							},
						},
						validate = { enable = true },
					},
				},
			},
			setup = {
				eslint = function()
					local function get_client(buf)
						return require("lazyvim.util").lsp.get_clients({ name = "eslint", bufnr = buf })[1]
					end

					local formatter = require("lazyvim.util").lsp.formatter({
						name = "eslint: lsp",
						primary = false,
						priority = 200,
						filter = "eslint",
					})
					--
					-- Use EslintFixAll on Neovim < 0.10.0
					if not pcall(require, "vim.lsp._dynamic") then
						formatter.name = "eslint: EslintFixAll"
						formatter.sources = function(buf)
							local client = get_client(buf)
							return client and { "eslint" } or {}
						end
						formatter.format = function(buf)
							local client = get_client(buf)
							if client then
								local diag =
									vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
								if #diag > 0 then
									vim.cmd("EslintFixAll")
								end
							end
						end
					end

					require("lazyvim.util").format.register(formatter)
				end,
			},
		},

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			--Lsp setup
			local lspconfig = require("lspconfig")

			lspconfig.eslint.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})

			lspconfig.html.setup({
				capabilities = capabilities,
			})
			--
			-- lspconfig.stylelint_lsp.setup({
			-- 	capabilities = capabilities,
			-- })
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})

			-- LSP FOR LUA
			lspconfig.lua_ls.setup({
				-- enabled = false,
				single_file_support = true,
				settings = {
					Lua = {
						globals = {
							"vim",
						},
						workspace = {
							checkThirdParty = false,
						},
						completion = {
							workspaceWord = true,
							callSnippet = "Both",
						},
						hint = {
							enable = true,
							setType = false,
							paramType = true,
							paramName = "Disable",
							semicolon = "Disable",
							arrayIndex = "Disable",
						},
						doc = {
							privateName = { "^_" },
						},
						type = {
							castNumberToInteger = true,
						},
						diagnostics = {
							globals = { "vim" },
							disable = { "incomplete-signature-doc", "trailing-space" },
							enable = false,
							groupSeverity = {
								strong = "Warning",
								strict = "Warning",
							},
							groupFileStatus = {
								["ambiguity"] = "Opened",
								["await"] = "Opened",
								["codestyle"] = "None",
								["duplicate"] = "Opened",
								["global"] = "Opened",
								["luadoc"] = "Opened",
								["redefined"] = "Opened",
								["strict"] = "Opened",
								["strong"] = "Opened",
								["type-check"] = "Opened",
								["unbalanced"] = "Opened",
								["unused"] = "Opened",
							},
							unusedLocalExclude = { "_*" },
						},
						format = {
							enable = false,
							defaultConfig = {
								indent_style = "space",
								indent_size = "2",
								continuation_indent_size = "2",
							},
						},
					},
				},
			})

			local opts = { noremap = true, silent = false }
			vim.cmd("highlight FloatBorder guibg=NONE")

			-- REGULAR KEYMAP
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "diagnostic go to prev" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "diagnostic go to next" })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			-- vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", {}) -- show definition, references

			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", {})

			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					client.server_capabilities.semanticTokensProvider = nil
				end,
			})
		end,
	},
}
