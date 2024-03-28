-- return {
-- 	"craftzdog/solarized-osaka.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("solarized-osaka").setup({
-- 			transparent = true,
-- 		})
-- 		vim.cmd([[colorscheme solarized-osaka]])
-- 	end,
-- }

return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "dark",
	},
}
--
-- want to add tokyonight as colorschemeq
-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.tokyonight_style = "night"
-- 		vim.g.tokyonight_italic_functions = true
-- 		vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- 		vim.g.tokyonight_dark_sidebar = true
-- 		vim.g.tokyonight_dark_float = true
-- 		vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
-- 		vim.cmd([[colorscheme tokyonight]])
-- 	end,
-- }
