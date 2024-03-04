return {
	"pmizio/typescript-tools.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		local api = require("typescript-tools.api")

		require("typescript-tools").setup({
			handlers = {
				["textDocument/publishDiagnostics"] = api.filter_diagnostics({ 1109, 1002, 80006, 6133 }),
			},
			settings = {
				tsserver_plugins = {
					"@styled/typescript-styled-plugin",
					"typescript-styled-plugin",
				},
			},
		})
	end,
}
