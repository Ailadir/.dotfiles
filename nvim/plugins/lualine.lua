return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	opts = {
		options = {
			-- theme = "monokai-pro",
			-- theme = "solarized-osaka",
			-- theme = "kanagawa",
			-- theme = "tokyonight",
			-- theme = "dracula",
			theme = "gruvbox",
			icons_enables = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {
				{ "filename", path = 1 },
			},
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
