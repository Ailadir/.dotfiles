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

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		null_ls.setup({
			sources = {
				diagnostics.stylelint,
				formatting.stylua,
				diagnostics.prettierd,
				-- null_ls.builtins.diagnostics.erb_lint,
				formatting.stylelint,
				-- diagnostics.eslint_d,
				-- formatting.eslint_d,
				-- diagnostics.rubocop,
				-- formatting.rubocop,
				-- diagnostics.prettierd.with({
				-- 	condition = function(utils)
				-- 		local eslintConfigFiles = {
				-- 			".eslintrc.js",
				-- 			".eslintrc.cjs",
				-- 			".eslintrc.json",
				-- 		}
				--
				-- 		for _, file in ipairs(eslintConfigFiles) do
				-- 			if utils.root_has_file(file) then
				-- 				return false
				-- 			end
				-- 		end
				-- 		return true
				-- 		-- return utils.with.root_has_file {
				-- 		--   ".prettierrc",
				-- 		--   ".prettierrc.json",
				-- 		--   ".prettierrc.js",
				-- 		--   "prettier.config.js",
				-- 		-- }
				-- 	end,
				-- }),
				formatting.prettierd.with({
					extra_filetype = { "scss" },
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
						end
						return true
						-- return utils.with.root_has_file {
						--   ".prettierrc",
						--   ".prettierrc.json",
						--   ".prettierrc.js",
						--   "prettier.config.js",
						-- }
					end,
				}),

				diagnostics.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" })
					end,
				}),

				formatting.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" })
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
