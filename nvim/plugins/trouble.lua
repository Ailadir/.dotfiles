return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		vim.keymap.set("n", "<leader>fx", function()
			require("trouble").toggle()
		end),
	},
}
