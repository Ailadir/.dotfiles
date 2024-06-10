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

-- return {
-- 	"ellisonleao/gruvbox.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = true,
-- 	opts = {},
-- }
-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("kanagawa").setup({
-- 			compile = false,
-- 			undercurl = true,
-- 			functionStyle = { bold = true },
-- 			dimInactive = true,
-- 			terminalColors = true,
-- 		})
-- 		vim.cmd("colorscheme kanagawa-wave")
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
-- 	--  theme = "wave"
-- 	-- background = {
-- 	-- 	dark = "",
-- 	-- 	light = "lotus",
-- 	-- },
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
-- return {
-- 	"loctvl842/monokai-pro.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		vim.cmd([[colorscheme monokai-pro]])
-- 	end,
-- }
return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,

	opts = {
		color_overrides = {
			mocha = { -- custom
				rosewater = "#ffc6be",
				flamingo = "#fb4934",
				pink = "#ff75a0",
				mauve = "#f2594b",
				red = "#f2594b",
				maroon = "#fe8019",
				peach = "#FFAD7D",
				yellow = "#e9b143",
				green = "#b0b846",
				teal = "#8bba7f",
				sky = "#7daea3",
				sapphire = "#689d6a",
				blue = "#80aa9e",
				lavender = "#e2cca9",
				text = "#e2cca9",
				subtext1 = "#e2cca9",
				subtext0 = "#e2cca9",
				overlay2 = "#8C7A58",
				overlay1 = "#735F3F",
				overlay0 = "#806234",
				surface2 = "#665c54",
				surface1 = "#3c3836",
				surface0 = "#32302f",
				base = "#282828",
				mantle = "#1d2021",
				crust = "#1b1b1b",
			},
		},
	},
}
