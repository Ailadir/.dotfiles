return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>fx",
			"<cmd>Trouble<cr>",
			desc = "Toggle Trouble",
		},
	},
}
