return {
	"nvimtools/none-ls.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.stylelint,
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.prettier,
				-- null_ls.builtins.diagnostics.erb_lint,
				null_ls.builtins.formatting.stylelint,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.eslint_d,
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.formatting.rubocop,
			},
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
