return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		lazy = false, -- This plugin does not support lazy-loading
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			local ts_config = require("nvim-treesitter.config")
			local parsers = {
				"bash",
				"c",
				"css",
				"diff",
				"go",
				"gomod",
				"html",
				"javascript",
				"json",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"rust",
				"scss",
				"tsx",
				"typescript",
				"vue",
				"vim",
				"vimdoc",
				"php",
				"php_only",
			}

			-- Force-install parsers that are missing their highlight queries.
			-- This handles the case where parser .so files exist from a previous install
			-- but the queries directory was never populated (no queries = no colors).
			local installed_queries = ts_config.get_installed("queries")
			local missing = vim.tbl_filter(function(lang)
				return not vim.list_contains(installed_queries, lang)
			end, parsers)

			if #missing > 0 then
				ts.install(missing, { force = true })
			end

			-- Also run a normal install for any parsers not yet installed at all
			ts.install(parsers)

			-- Enable treesitter highlighting for all real file buffers
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "*",
				callback = function(event)
					local bufnr = event.buf
					if vim.bo[bufnr].buftype ~= "" then
						return
					end
					pcall(vim.treesitter.start, bufnr)
				end,
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
