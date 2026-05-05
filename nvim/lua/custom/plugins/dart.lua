return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
		"saghen/blink.cmp",
	},

	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		require("flutter-tools").setup({
			lsp = {
				capabilities = capabilities,
				settings = {
					showTodos = true,
					completeFunctionCalls = true,
				},
			},
		})
	end,
}
