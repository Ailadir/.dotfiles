return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
		"BufReadPost",
		"BufWritePost",
		"InsertLeave",
	},
	opts = {
		linters_by_ft = {
			-- javascript = { "eslint" },
			-- javascriptreact = { "eslint" },
			-- typescript = { "eslint" },
			-- typescriptreact = { "eslint" },
			css = { "stylelint" },
			scss = { "stylelint" },
			html = { "prettierd" },
		},
	},
	-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	-- 	callback = function()
	-- 		require("lint").try_lint()
	-- 	end,
	-- }),
}
