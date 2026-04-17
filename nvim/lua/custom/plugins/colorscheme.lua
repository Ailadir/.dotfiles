-- return {
-- 	{
-- 		"catppuccin/nvim",
-- 		name = "catppuccin",
-- 		lazy = false,
-- 		priority = 1000,
-- 		opts = {
-- 			transparent_background = true,
-- 			integrations = {
-- 				bufferline = true,
-- 			},
-- 			color_overrides = {
-- 				mocha = {
-- 					rosewater = "#ffc6be",
-- 					flamingo = "#fb4934",
-- 					pink = "#ff75a0",
-- 					mauve = "#f2594b",
-- 					red = "#f2594b",
-- 					maroon = "#fe8019",
-- 					peach = "#FFAD7D",
-- 					yellow = "#e9b143",
-- 					green = "#b0b846",
-- 					teal = "#8bba7f",
-- 					sky = "#7daea3",
-- 					sapphire = "#689d6a",
-- 					blue = "#80aa9e",
-- 					lavender = "#e2cca9",
-- 					text = "#e2cca9",
-- 					subtext1 = "#e2cca9",
-- 					subtext0 = "#e2cca9",
-- 					overlay2 = "#8C7A58",
-- 					overlay1 = "#735F3F",
-- 					overlay0 = "#806234",
-- 					surface2 = "#665c54",
-- 					surface1 = "#3c3836",
-- 					surface0 = "#32302f",
-- 					base = "#282828",
-- 					mantle = "#1d2021",
-- 					crust = "#1b1b1b",
-- 				},
-- 			},
-- 		},
-- 		config = function(_, opts)
-- 			require("catppuccin").setup(opts)
-- 			vim.cmd.colorscheme("catppuccin")
-- 		end,
-- 	},
-- }
--
--
-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	lazy = false, -- load at startup
-- 	priority = 1000, -- load before other plugins
-- 	opts = {
-- 		compile = true, -- enable compilation for faster loading [4]
-- 		undercurl = true,
-- 		commentStyle = { italic = true },
-- 		functionStyle = {},
-- 		keywordStyle = { italic = true },
-- 		statementStyle = { bold = true },
-- 		typeStyle = {},
-- 		variablebuiltinStyle = { italic = true },
-- 		specialReturn = true,
-- 		specialError = true,
-- 		transparent = true, -- change to true if you want transparency
-- 		dimInactive = false,
-- 		theme = "wave", -- "wave", "dragon", "lotus"
-- 		background = { dark = "wave", light = "lotus" },
-- 	},
-- 	config = function(_, opts)
-- 		require("kanagawa").setup(opts)
-- 		vim.cmd("colorscheme kanagawa")
-- 	end,
-- }
-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {
-- 		transparent = true,
-- 	},
-- 	config = function(_, opts)
-- 		require("tokyonight").setup(opts)
-- 		vim.cmd.colorscheme("tokyonight")
-- 	end,
-- }
--

return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		-- Optionally configure and load the colorscheme
		-- directly inside the plugin declaration.
		--
		vim.g.gruvbox_material_foreground = "material"
		vim.g.gruvbox_material_background = "medium"

		vim.g.gruvbox_material_transparent_background = 2
		vim.g.gruvbox_material_enable_italic = true
		vim.cmd.colorscheme("gruvbox-material")
	end,
}
