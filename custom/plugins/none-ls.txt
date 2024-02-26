return {
	"nvimtools/none-ls.nvim",
	lazy = false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
		"plenary.nvim",
	},
	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		null_ls.setup({

			debug = false,

			sources = {
				diagnostics.eslint_d,
				diagnostics.stylelint,
				formatting.stylua,
				formatting.stylelint,
				formatting.rubocop,
				-- formatting.eslint_d.with({
				-- 	condition = function(utils)
				-- 		return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" })
				-- 	end,
				-- }),
				formatting.eslint_d,
				formatting.prettierd.with({
					extra_filetypes = { "html", "scss", "css" },
					condition = function(utils)
						local eslintConfigFiles = {
							".eslintrc.js",
							".eslintrc.cjs",
							".eslintrc.json",
						}
						for _, file in ipairs(eslintConfigFiles) do
							if utils.root_has_file(file) then
								return false
							end
							return true
						end
					end,
				}),
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
