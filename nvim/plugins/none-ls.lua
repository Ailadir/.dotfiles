return {
	"nvimtools/none-ls.nvim",
	-- lazy = false,
	-- event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		null_ls.setup({
			-- debug = true,

			sources = {
				diagnostics.stylelint,
				formatting.stylua,
				formatting.prettierd.with({
					filetypes = { "md", "markdown" },
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
				-- formatting.biome,
				formatting.prettierd.with({
					filetypes = { "html", "json" },
				}),
				formatting.biome.with({
					extra_filetypes = { "html", "scss", "css", "json" },
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
						-- return utils.with.root_has_file({
						-- 	".prettierrc",
						-- 	".prettierrc.json",
						-- 	".prettierrc.js",
						-- 	"prettier.config.js",
						-- })
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
