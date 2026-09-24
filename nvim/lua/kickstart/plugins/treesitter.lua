-- return {
-- 	{ -- Highlight, edit, and navigate code
-- 		"nvim-treesitter/nvim-treesitter",
-- 		lazy = false, -- This plugin does not support lazy-loading
-- 		build = ":TSUpdate",
-- 		config = function()
-- 			local ts = require("nvim-treesitter")
-- 			local ts_config = require("nvim-treesitter.config")
-- 			local parsers = {
-- 				"bash",
-- 				"c",
-- 				"css",
-- 				"diff",
-- 				"go",
-- 				"gomod",
-- 				"html",
-- 				"javascript",
-- 				"json",
-- 				"lua",
-- 				"luadoc",
-- 				"markdown",
-- 				"markdown_inline",
-- 				"query",
-- 				"rust",
-- 				"scss",
-- 				"tsx",
-- 				"typescript",
-- 				"vue",
-- 				"vim",
-- 				"vimdoc",
-- 				"php",
-- 				"php_only",
-- 				"dockerfile",
-- 			}
--
-- 			-- Force-install parsers that are missing their highlight queries.
-- 			-- This handles the case where parser .so files exist from a previous install
-- 			-- but the queries directory was never populated (no queries = no colors).
-- 			local installed_queries = ts_config.get_installed("queries")
-- 			local missing = vim.tbl_filter(function(lang)
-- 				return not vim.list_contains(installed_queries, lang)
-- 			end, parsers)
--
-- 			if #missing > 0 then
-- 				ts.install(missing, { force = true })
-- 			end
--
-- 			-- Also run a normal install for any parsers not yet installed at all
-- 			ts.install(parsers)
--
-- 			require("nvim-treesitter.config").setup({
-- 				highlight = {
-- 					enable = true,
-- 					additional_vim_regex_highlighting = false,
-- 				},
-- 			})
-- 			-- Enable treesitter highlighting for all real file buffers
-- 			vim.api.nvim_create_autocmd("FileType", {
-- 				pattern = "*",
-- 				callback = function(event)
-- 					local bufnr = event.buf
-- 					if vim.bo[bufnr].buftype ~= "" then
-- 						return
-- 					end
-- 					pcall(vim.treesitter.start, bufnr)
-- 				end,
-- 			})
-- 		end,
-- 	},
-- }
-- -- vim: ts=2 sts=2 sw=2 et
--
--
-- return {
-- 	-- Highlight, edit, and navigate code
-- 	"nvim-treesitter/nvim-treesitter",
-- 	build = ":TSUpdate",
-- 	opts = {
-- 		ensure_installed = {
-- 			"bash",
-- 			"c",
-- 			"css",
-- 			"diff",
-- 			"html",
-- 			"lua",
-- 			"luadoc",
-- 			"markdown",
-- 			"markdown_inline",
-- 			"vim",
-- 			"vimdoc",
-- 			"css",
-- 			"go",
-- 			"gomod",
-- 			"gotmpl",
-- 			"gosum",
-- 			"gowork",
-- 			"query",
-- 			"rust",
-- 			"yaml",
-- 			"python",
-- 			"json",
-- 			"javascript",
-- 			"typescript",
-- 			"scss",
-- 			"tsx",
-- 			"vue",
-- 			"vim",
-- 			"vimdoc",
-- 			"php",
-- 			"php_only",
-- 			"dockerfile",
-- 			"sql",
-- 			"csv",
-- 		},
-- 		-- Autoinstall languages that are not installed
-- 		auto_install = true,
-- 		highlight = {
-- 			enable = true,
-- 			-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
-- 			--  If you are experiencing weird indenting issues, add the language to
-- 			--  the list of additional_vim_regex_highlighting and disabled languages for indent.
-- 			additional_vim_regex_highlighting = { "ruby" },
-- 		},
-- 		indent = { enable = true, disable = { "ruby" } },
-- 	},
-- 	config = function(_, opts)
-- 		--
-- 		-- For detecting go template files
-- 		vim.filetype.add({
-- 			extension = {
-- 				gotmpl = "gotmpl",
-- 				gohtml = "gotmpl",
-- 				gohtmltmpl = "gotmpl",
-- 				gohtxttmpl = "gotmpl",
-- 				gohtexttmpl = "gotmpl",
-- 			},
-- 		})
-- 		-- For detecting go template files
-- 		--
-- 		require("nvim-treesitter").setup(opts)
-- 	end,
-- }
--
--Update to new treesitter branch/test
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"css",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"vim",
			"vimdoc",
			"go",
			"gomod",
			"gotmpl",
			"gosum",
			"gowork",
			"query",
			"rust",
			"yaml",
			"python",
			"json",
			"javascript",
			"typescript",
			"scss",
			"tsx",
			"vue",
			"php",
			"php_only",
			"dockerfile",
			"sql",
			"csv",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter").setup(opts)

		vim.filetype.add({
			extension = {
				gotmpl = "gotmpl",
				gohtml = "gotmpl",
				gohtmltmpl = "gotmpl",
				gohtxttmpl = "gotmpl",
				gohtexttmpl = "gotmpl",
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = opts.ensure_installed, -- or "*" and let pcall guard it
			callback = function()
				pcall(vim.treesitter.start)
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.bo.indentexpr = "v:lua.vim.treesitter.indentexpr()"
			end,
		})
	end,
}
