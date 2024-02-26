-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
-- 	priority = 1000, -- make sure to load this before all the other start plugins
-- 	config = function()
-- 		-- load the colorscheme here
-- 		-- vim.cmd([[colorscheme catppuccin-mocha]])
-- 		vim.cmd.colorscheme("catppuccin-macchiato")
--
-- 		require("catppuccin").setup({
-- 			flavour = "macchiato",
-- 			integrations = {
-- 				cmp = true,
-- 				gitsigns = true,
-- 				nvimtree = true,
-- 				treesitter = true,
-- 				notify = false,
-- 				mini = {
-- 					enabled = true,
-- 					indentscope_color = "",
-- 				},
-- 			},
-- 		})
-- 	end,
-- }
-- return {
-- 	"craftzdog/solarized-osaka.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- }
--
--
-- return
-- {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = { style = "moon" },
-- }

return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "dark",
		},
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = { style = "moon" },
	-- },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "kanagawa",
		},
	},
}
