return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufReadPost", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { { "eslint_d", "prettierd" } },
				typescript = { { "eslint_d", "prettierd" } },
				scss = { { "stylelint", "prettierd" } },
				css = { { "stylelint", "prettierd" } },
				html = { { "prettierd" } },
				lua = { "stylua" },
				fish = { "fish_indent" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
				python = { "isort", "black" },
				["*"] = { "codespell" },
				["_"] = { "trim_whitespace" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},

			formatters = {
				prettierd = {
					command = "prettierd",
					args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
					rootPatterns = {
						".prettierrc",
						".prettierrc.json",
						".prettierrc.toml",
						".prettierrc.js",
						".prettierrc.cjs",
						".prettierrc.json5",
						".prettierrc.yaml",
						".prettierrc.yml",
						"prettier.config.js",
						"prettier.config.cjs",
						"prettier.config.mjs",
						".editorconfig",
					},
				},
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
