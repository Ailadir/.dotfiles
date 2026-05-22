return {
	"windwp/nvim-ts-autotag",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-ts-autotag").setup()
	end,
	dependencies = { "nvim-treesitter/nvim-treesitter" },
}
