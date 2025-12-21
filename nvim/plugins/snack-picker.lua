return {
	"folke/snacks.nvim",
	opts = {
		keys = {
			{ "<leader>st", false },
			{ "<leader>st", "<cmd>TodoQuickFix<cr>", desc = "Todo in current directory" },
			{
				"<leader>fj",
				function()
					require("snacks.picker").git_files({
						-- finder = "git_files",

						finder = "git_status",
						show_empty = true,
						format = "file",
						-- untracked = false,
						-- submodules = false,
					})
				end,
				desc = "Find git files",
			},
		},
		-- picker = {
		-- 	layout = {
		-- 		layout = {
		-- 			box = "vertical",
		-- 			backdrop = false,
		-- 			row = -1,
		-- 			width = 0,
		-- 			height = 90,
		-- 			border = "top",
		-- 			title = " {title} {live} {flags}",
		-- 			title_pos = "left",
		-- 			{ win = "input", height = 1, border = "bottom" },
		-- 			{
		-- 				box = "horizontal",
		-- 				{ win = "list", border = "top" },
		-- 				{ win = "preview", title = "{preview}", width = 0.7, border = "rounded" },
		-- 			},
		-- 		},
		-- 	},
	},
	-- },
}
