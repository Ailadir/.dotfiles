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
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = true,
	opts = {},
}
-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	-- 	config = function()
-- 		require("kanagawa").setup({
-- 			compile = false,
-- 			undercurl = true,
-- 			functionStyle = { bold = true },
-- 			dimInactive = true,
-- 			terminalColors = true,
-- 		})
-- 		-- vim.cmd("colorscheme kanagawa-wave")
-- 		-- vim.cmd("colorscheme kanagawa-dragon")
-- 		-- vim.cmd("colorscheme kanagawa-lotus")
-- 	end,
-- 	overrides = function(colors)
-- 		local theme = colors.theme
-- 		return {
-- 			NormalFloat = { bg = "none" },
-- 			FloatBorder = { bg = "none" },
-- 			FloatTitle = { bg = "none" },
-- 			NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
-- 			LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
-- 			MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
-- 			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
-- 			PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
-- 			PmenuSbar = { bg = theme.ui.bg_m1 },
-- 			PmenuThumb = { bg = theme.ui.bg_p2 },
-- 		}
-- 	end,
--   theme = "wave"
-- 	background = {
-- 		dark = "",
-- 		light = "lotus",
-- 	},
-- 	-- opts = {
-- 	-- 	background = {
-- 	-- 		dark = "lotus",
-- 	--
-- 	-- 	},
-- 	-- 	-- style = "dark",
-- 	-- },
-- }
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
