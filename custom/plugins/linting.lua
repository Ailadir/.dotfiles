return {
	"mfussenegger/nvim-lint",
	event = {
		"BufWritePre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			lua = { "luacheck" },
			python = { "flake8" },
			sh = { "shellcheck" },
			yaml = { "yamllint" },
			json = { "jsonlint" },
			markdown = { "markdownlint" },
			vim = { "vint" },
			html = { "htmlhint" },
			css = { "stylelint" },
			scss = { "stylelint" },
			graphql = { "graphql" },
			swift = { "swiftlint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
