return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		lazy = false, -- This plugin does not support lazy-loading
		build = ":TSUpdate",
		config = function()
			-- Install parsers programmatically (main branch API)
			local ts = require("nvim-treesitter")
			local parsers = {
				"bash",
				"c",
				"css",
				"diff",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"scss",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"php", -- Added PHP support
				"php_only", -- Added PHP-only support
			}

			-- Install each parser
			for _, parser in ipairs(parsers) do
				ts.install(parser)
			end

			-- Enable treesitter highlighting via autocommand
			-- Only for real file types, not plugin buffers
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "*",
				callback = function(event)
					local bufnr = event.buf
					-- Skip plugin/scratch buffers
					if vim.bo[bufnr].buftype ~= "" then
						return
					end
					-- Try to start treesitter, ignore errors for unsupported filetypes
					pcall(vim.treesitter.start, bufnr)
				end,
			})
		end,
		-- There are additional nvim-treesitter modules that you can use to interact
		-- with nvim-treesitter. You should go explore a few and see what interests you:
		--
		--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
		--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
		--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	},
}
-- vim: ts=2 sts=2 sw=2 et
