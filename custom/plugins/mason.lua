return {
	{
		"williamboman/mason.nvim",
		lazy = false,
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
				-- list of servers for mason to install
				ensure_installed = {
					"tsserver",
					"html",
					"cssls",
					"tailwindcss",
					"svelte",
					"lua_ls",
					"graphql",
					"emmet_ls",
					"prismals",
					"pyright",
				},
				-- auto-install configured servers (with lspconfig)
				automatic_installation = true, -- not the same as ensure_installed
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettierd", -- prettier formatter
					"stylua", -- lua formatter
					"isort", -- python formatter
					"black", -- python formatter
					"pylint", -- python linter
					"eslint_d", -- js linter
					"stylelint",
				},
			})
		end,
	},
	-- {
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	after = "mason.nvim",
	-- 	lazy = false,
	-- 	opts = {
	-- 		auto_install = true,
	-- 		ensure_installed = {
	-- 			"tsserver",
	-- 			"html",
	-- 			"cssls",
	-- 			"tailwindcss",
	-- 			"svelte",
	-- 			"lua_ls",
	-- 			"graphql",
	-- 			"emmet_ls",
	-- 			"prismals",
	-- 			"pyright",
	-- 		},
	-- 	},
	-- },
	{
		"pmizio/typescript-tools.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		config = function()
			local api = require("typescript-tools.api")

			require("typescript-tools").setup({
				handlers = {
					["textDocument/publishDiagnostics"] = api.filter_diagnostics(
						-- Ignore 'This may be converted to an async function' diagnostics.
						{ 80006, 6133 }
					),
				},
				settings = {
					tsserver_plugins = {
						-- for TypeScript v4.9+
						"@styled/typescript-styled-plugin",
						-- or for older TypeScript versions
						-- "typescript-styled-plugin",
					},
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "pmizio/typescript-tools.nvim" },
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			-- lspconfig.tsserver.setup({
			-- 	capabilities = capabilities,
			-- })
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
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

-- return {
--   "williamboman/mason.nvim",
--   dependencies = {
--     "williamboman/mason-lspconfig.nvim",
--     "WhoIsSethDaniel/mason-tool-installer.nvim",
--   },
--   config = function()
--     -- import mason
--     local mason = require "mason"
--
--     -- import mason-lspconfig
--
--     local mason_tool_installer = require "mason-tool-installer"
--
--     -- enable mason and configure icons
--     mason.setup {
--       ui = {
--         icons = {
--           package_installed = "✓",
--           package_pending = "➜",
--           package_uninstalled = "✗",
--         },
--       },
--     }
--     local mason_lspconfig = require "mason-lspconfig"
--
--     mason_lspconfig.setup {
--       -- list of servers for mason to install
--       ensure_installed = {
--         "tsserver",
--         "html",
--         "cssls",
--         "tailwindcss",
--         "svelte",
--         "lua_ls",
--         "graphql",
--         "emmet_ls",
--         "prismals",
--         "pyright",
--       },
--       -- auto-install configured servers (with lspconfig)
--       automatic_installation = true, -- not the same as ensure_installed
--     }
--
--     mason_tool_installer.setup {
--       ensure_installed = {
--         "prettierd", -- prettier formatter
--         "stylua", -- lua formatter
--         "isort", -- python formatter
--         "black", -- python formatter
--         "pylint", -- python linter
--         "eslint_d", -- js linter
--         "stylelint",
--       },
--     }
--   end,
-- }
