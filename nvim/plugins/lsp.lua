return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_installation = true,
		})

		-- Auto-setup LSP servers installed via Mason
		require("mason-lspconfig").setup_handlers({
			-- Default handler for all servers
			function(server_name)
				require("lspconfig")[server_name].setup({})
			end,
		})
	end,
}
