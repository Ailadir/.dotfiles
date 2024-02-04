return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"pmizio/typescript-tools.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
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
--     local mason_lspconfig = require "mason-lspconfig"
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
